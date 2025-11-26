.class public Lcom/radaee/reader/GLView;
.super Landroid/opengl/GLSurfaceView;
.source "GLView.java"

# interfaces
.implements Lcom/radaee/reader/GLCanvas$CanvasListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/reader/GLView$OnPixelCopy;,
        Lcom/radaee/reader/GLView$TouchRunnable;,
        Lcom/radaee/reader/GLView$PDFGestureListener;,
        Lcom/radaee/reader/GLView$OnAfterSelect;,
        Lcom/radaee/reader/GLView$PDFGLPageSet;,
        Lcom/radaee/reader/GLView$OnBeforeLinkJump;
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
.field private final OnNoneDown:Ljava/lang/Runnable;

.field private final OnNoneMove:Lcom/radaee/reader/GLView$TouchRunnable;

.field private final OnNoneUp:Lcom/radaee/reader/GLView$TouchRunnable;

.field private final OnZoomEnd:Ljava/lang/Runnable;

.field private final OnZoomMove:Lcom/radaee/reader/GLView$TouchRunnable;

.field private final OnZoomStart:Ljava/lang/Runnable;

.field annotRectChanged:Z

.field public beforePageJump:Lcom/radaee/reader/GLView$OnBeforeLinkJump;

.field public disableAnnotCheck:Z

.field private disabled:Z

.field force_sel_end:I

.field force_sel_start:I

.field private is_notified:Z

.field private is_waitting:Z

.field private mReadOnly:Z

.field private m_aMenu:Lcom/radaee/annotui/UIAnnotMenu;

.field private m_amgr:Landroid/app/ActivityManager;

.field public m_annot:Lcom/radaee/pdf/Page$Annotation;

.field public m_annot_page:Lcom/radaee/view/GLPage;

.field private m_annot_pg:Lcom/radaee/pdf/Page;

.field public m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

.field private m_annot_rect:[F

.field private m_annot_rect0:[F

.field private m_annot_x0:F

.field private m_annot_y0:F

.field private m_back_color:I

.field private m_canvas:Lcom/radaee/reader/GLCanvas;

.field private m_combo_item:I

.field public m_cur_pageno:I

.field public m_doc:Lcom/radaee/pdf/Document;

.field private m_edit_type:I

.field private m_gesture:Landroid/view/GestureDetector;

.field private m_gl10:Ljavax/microedition/khronos/opengles/GL10;

.field private m_goto_pos:Lcom/radaee/view/GLLayout$PDFPos;

.field private m_h:I

.field private m_hold:Z

.field private m_hold_docx:I

.field private m_hold_docy:I

.field private m_hold_x:F

.field private m_hold_y:F

.field private m_icon:Landroid/graphics/Bitmap;

.field private final m_info:Landroid/app/ActivityManager$MemoryInfo;

.field private final m_info_paint:Landroid/graphics/Paint;

.field private m_ink:Lcom/radaee/pdf/Ink;

.field public m_layout:Lcom/radaee/view/GLLayout;

.field private m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

.field private m_note_indecs:[I

.field private m_note_pages:[Lcom/radaee/view/GLPage;

.field private m_opstack:Lcom/radaee/reader/PDFLayoutOPStack;

.field private m_pCombo:Landroid/widget/PopupWindow;

.field private m_pEdit:Lcom/radaee/annotui/UIAnnotPopEdit;

.field private m_page_gap:I

.field private m_polygon:Lcom/radaee/pdf/Path;

.field private m_rects:[F

.field private m_save_pos:Lcom/radaee/view/GLLayout$PDFPos;

.field public m_sel:Lcom/radaee/view/VSel;

.field private m_sel_icon1:Landroid/graphics/Bitmap;

.field private m_sel_icon2:Landroid/graphics/Bitmap;

.field public m_status:I

.field private m_view_mode:I

.field private m_w:I

.field private m_zoom_dis0:F

.field private m_zoom_pos:Lcom/radaee/view/GLLayout$PDFPos;

.field private m_zoom_scale:F

.field public scoll_lock:Z

.field public tapDownForAnnot:Z

.field public ttsPara:Landroid/graphics/RectF;

.field public tts_annot_page:Lcom/radaee/view/GLPage;

.field public tts_sel:Lcom/radaee/view/VSel;

.field vert_scroll_locked:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 509
    invoke-direct {p0, p1}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 91
    iput v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 93
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->tapDownForAnnot:Z

    .line 94
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->disableAnnotCheck:Z

    .line 95
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->scoll_lock:Z

    const v1, -0x3f3f40

    .line 103
    iput v1, p0, Lcom/radaee/reader/GLView;->m_back_color:I

    .line 104
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->mReadOnly:Z

    const/4 v1, 0x4

    .line 519
    iput v1, p0, Lcom/radaee/reader/GLView;->m_page_gap:I

    .line 521
    iput v0, p0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    .line 710
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->is_notified:Z

    .line 711
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->is_waitting:Z

    .line 967
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->m_hold:Z

    .line 1088
    new-instance v1, Lcom/radaee/reader/GLView$11;

    invoke-direct {v1, p0}, Lcom/radaee/reader/GLView$11;-><init>(Lcom/radaee/reader/GLView;)V

    iput-object v1, p0, Lcom/radaee/reader/GLView;->OnNoneDown:Ljava/lang/Runnable;

    .line 1097
    new-instance v1, Lcom/radaee/reader/GLView$12;

    invoke-direct {v1, p0}, Lcom/radaee/reader/GLView$12;-><init>(Lcom/radaee/reader/GLView;)V

    iput-object v1, p0, Lcom/radaee/reader/GLView;->OnNoneMove:Lcom/radaee/reader/GLView$TouchRunnable;

    .line 1122
    new-instance v1, Lcom/radaee/reader/GLView$13;

    invoke-direct {v1, p0}, Lcom/radaee/reader/GLView$13;-><init>(Lcom/radaee/reader/GLView;)V

    iput-object v1, p0, Lcom/radaee/reader/GLView;->OnNoneUp:Lcom/radaee/reader/GLView$TouchRunnable;

    .line 1146
    new-instance v1, Lcom/radaee/reader/GLView$14;

    invoke-direct {v1, p0}, Lcom/radaee/reader/GLView$14;-><init>(Lcom/radaee/reader/GLView;)V

    iput-object v1, p0, Lcom/radaee/reader/GLView;->OnZoomStart:Ljava/lang/Runnable;

    .line 1197
    new-instance v1, Lcom/radaee/reader/GLView$15;

    invoke-direct {v1, p0}, Lcom/radaee/reader/GLView$15;-><init>(Lcom/radaee/reader/GLView;)V

    iput-object v1, p0, Lcom/radaee/reader/GLView;->OnZoomMove:Lcom/radaee/reader/GLView$TouchRunnable;

    .line 1207
    new-instance v1, Lcom/radaee/reader/GLView$16;

    invoke-direct {v1, p0}, Lcom/radaee/reader/GLView$16;-><init>(Lcom/radaee/reader/GLView;)V

    iput-object v1, p0, Lcom/radaee/reader/GLView;->OnZoomEnd:Ljava/lang/Runnable;

    const/4 v1, 0x0

    .line 1277
    iput-object v1, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    .line 1278
    iput-object v1, p0, Lcom/radaee/reader/GLView;->tts_annot_page:Lcom/radaee/view/GLPage;

    const/4 v2, -0x1

    .line 1279
    iput v2, p0, Lcom/radaee/reader/GLView;->force_sel_start:I

    iput v2, p0, Lcom/radaee/reader/GLView;->force_sel_end:I

    .line 1989
    new-instance v3, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v3}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    iput-object v3, p0, Lcom/radaee/reader/GLView;->m_info:Landroid/app/ActivityManager$MemoryInfo;

    .line 1990
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/radaee/reader/GLView;->m_info_paint:Landroid/graphics/Paint;

    .line 2042
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 2043
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    .line 2044
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 2045
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_pg:Lcom/radaee/pdf/Page;

    .line 2050
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    .line 2052
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_icon:Landroid/graphics/Bitmap;

    .line 2057
    new-instance v3, Lcom/radaee/reader/PDFLayoutOPStack;

    invoke-direct {v3}, Lcom/radaee/reader/PDFLayoutOPStack;-><init>()V

    iput-object v3, p0, Lcom/radaee/reader/GLView;->m_opstack:Lcom/radaee/reader/PDFLayoutOPStack;

    .line 2058
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_sel_icon1:Landroid/graphics/Bitmap;

    .line 2059
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_sel_icon2:Landroid/graphics/Bitmap;

    .line 2060
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_pEdit:Lcom/radaee/annotui/UIAnnotPopEdit;

    .line 2061
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_pCombo:Landroid/widget/PopupWindow;

    .line 2062
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_aMenu:Lcom/radaee/annotui/UIAnnotMenu;

    .line 2063
    iput v0, p0, Lcom/radaee/reader/GLView;->m_edit_type:I

    .line 2064
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    .line 2065
    iput v2, p0, Lcom/radaee/reader/GLView;->m_combo_item:I

    .line 2844
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_goto_pos:Lcom/radaee/view/GLLayout$PDFPos;

    .line 510
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 514
    invoke-direct {p0, p1, p2}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 91
    iput p2, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 93
    iput-boolean p2, p0, Lcom/radaee/reader/GLView;->tapDownForAnnot:Z

    .line 94
    iput-boolean p2, p0, Lcom/radaee/reader/GLView;->disableAnnotCheck:Z

    .line 95
    iput-boolean p2, p0, Lcom/radaee/reader/GLView;->scoll_lock:Z

    const v0, -0x3f3f40

    .line 103
    iput v0, p0, Lcom/radaee/reader/GLView;->m_back_color:I

    .line 104
    iput-boolean p2, p0, Lcom/radaee/reader/GLView;->mReadOnly:Z

    const/4 v0, 0x4

    .line 519
    iput v0, p0, Lcom/radaee/reader/GLView;->m_page_gap:I

    .line 521
    iput p2, p0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    .line 710
    iput-boolean p2, p0, Lcom/radaee/reader/GLView;->is_notified:Z

    .line 711
    iput-boolean p2, p0, Lcom/radaee/reader/GLView;->is_waitting:Z

    .line 967
    iput-boolean p2, p0, Lcom/radaee/reader/GLView;->m_hold:Z

    .line 1088
    new-instance v0, Lcom/radaee/reader/GLView$11;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$11;-><init>(Lcom/radaee/reader/GLView;)V

    iput-object v0, p0, Lcom/radaee/reader/GLView;->OnNoneDown:Ljava/lang/Runnable;

    .line 1097
    new-instance v0, Lcom/radaee/reader/GLView$12;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$12;-><init>(Lcom/radaee/reader/GLView;)V

    iput-object v0, p0, Lcom/radaee/reader/GLView;->OnNoneMove:Lcom/radaee/reader/GLView$TouchRunnable;

    .line 1122
    new-instance v0, Lcom/radaee/reader/GLView$13;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$13;-><init>(Lcom/radaee/reader/GLView;)V

    iput-object v0, p0, Lcom/radaee/reader/GLView;->OnNoneUp:Lcom/radaee/reader/GLView$TouchRunnable;

    .line 1146
    new-instance v0, Lcom/radaee/reader/GLView$14;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$14;-><init>(Lcom/radaee/reader/GLView;)V

    iput-object v0, p0, Lcom/radaee/reader/GLView;->OnZoomStart:Ljava/lang/Runnable;

    .line 1197
    new-instance v0, Lcom/radaee/reader/GLView$15;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$15;-><init>(Lcom/radaee/reader/GLView;)V

    iput-object v0, p0, Lcom/radaee/reader/GLView;->OnZoomMove:Lcom/radaee/reader/GLView$TouchRunnable;

    .line 1207
    new-instance v0, Lcom/radaee/reader/GLView$16;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$16;-><init>(Lcom/radaee/reader/GLView;)V

    iput-object v0, p0, Lcom/radaee/reader/GLView;->OnZoomEnd:Ljava/lang/Runnable;

    const/4 v0, 0x0

    .line 1277
    iput-object v0, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    .line 1278
    iput-object v0, p0, Lcom/radaee/reader/GLView;->tts_annot_page:Lcom/radaee/view/GLPage;

    const/4 v1, -0x1

    .line 1279
    iput v1, p0, Lcom/radaee/reader/GLView;->force_sel_start:I

    iput v1, p0, Lcom/radaee/reader/GLView;->force_sel_end:I

    .line 1989
    new-instance v2, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v2}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_info:Landroid/app/ActivityManager$MemoryInfo;

    .line 1990
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_info_paint:Landroid/graphics/Paint;

    .line 2042
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 2043
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    .line 2044
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 2045
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_pg:Lcom/radaee/pdf/Page;

    .line 2050
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    .line 2052
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_icon:Landroid/graphics/Bitmap;

    .line 2057
    new-instance v2, Lcom/radaee/reader/PDFLayoutOPStack;

    invoke-direct {v2}, Lcom/radaee/reader/PDFLayoutOPStack;-><init>()V

    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_opstack:Lcom/radaee/reader/PDFLayoutOPStack;

    .line 2058
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_sel_icon1:Landroid/graphics/Bitmap;

    .line 2059
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_sel_icon2:Landroid/graphics/Bitmap;

    .line 2060
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_pEdit:Lcom/radaee/annotui/UIAnnotPopEdit;

    .line 2061
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_pCombo:Landroid/widget/PopupWindow;

    .line 2062
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_aMenu:Lcom/radaee/annotui/UIAnnotMenu;

    .line 2063
    iput p2, p0, Lcom/radaee/reader/GLView;->m_edit_type:I

    .line 2064
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    .line 2065
    iput v1, p0, Lcom/radaee/reader/GLView;->m_combo_item:I

    .line 2844
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_goto_pos:Lcom/radaee/view/GLLayout$PDFPos;

    .line 515
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->init(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/reader/GLView;)Z
    .locals 0

    .line 75
    iget-boolean p0, p0, Lcom/radaee/reader/GLView;->m_hold:Z

    return p0
.end method

.method static synthetic access$100(Lcom/radaee/reader/GLView;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_hold_docx:I

    return p0
.end method

.method static synthetic access$1000(Lcom/radaee/reader/GLView;)V
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/radaee/reader/GLView;->clearAnnotState()V

    return-void
.end method

.method static synthetic access$102(Lcom/radaee/reader/GLView;I)I
    .locals 0

    .line 75
    iput p1, p0, Lcom/radaee/reader/GLView;->m_hold_docx:I

    return p1
.end method

.method static synthetic access$1100(Lcom/radaee/reader/GLView;)Lcom/radaee/reader/GLCanvas;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/radaee/reader/GLView;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_w:I

    return p0
.end method

.method static synthetic access$1402(Lcom/radaee/reader/GLView;I)I
    .locals 0

    .line 75
    iput p1, p0, Lcom/radaee/reader/GLView;->m_w:I

    return p1
.end method

.method static synthetic access$1500(Lcom/radaee/reader/GLView;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_h:I

    return p0
.end method

.method static synthetic access$1502(Lcom/radaee/reader/GLView;I)I
    .locals 0

    .line 75
    iput p1, p0, Lcom/radaee/reader/GLView;->m_h:I

    return p1
.end method

.method static synthetic access$1600(Lcom/radaee/reader/GLView;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_back_color:I

    return p0
.end method

.method static synthetic access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/radaee/reader/GLView;->m_gl10:Ljavax/microedition/khronos/opengles/GL10;

    return-object p0
.end method

.method static synthetic access$1702(Lcom/radaee/reader/GLView;Ljavax/microedition/khronos/opengles/GL10;)Ljavax/microedition/khronos/opengles/GL10;
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_gl10:Ljavax/microedition/khronos/opengles/GL10;

    return-object p1
.end method

.method static synthetic access$1800(Lcom/radaee/reader/GLView;)Lcom/radaee/view/GLLayout$PDFPos;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/radaee/reader/GLView;->m_goto_pos:Lcom/radaee/view/GLLayout$PDFPos;

    return-object p0
.end method

.method static synthetic access$1802(Lcom/radaee/reader/GLView;Lcom/radaee/view/GLLayout$PDFPos;)Lcom/radaee/view/GLLayout$PDFPos;
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_goto_pos:Lcom/radaee/view/GLLayout$PDFPos;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/radaee/reader/GLView;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_view_mode:I

    return p0
.end method

.method static synthetic access$1902(Lcom/radaee/reader/GLView;I)I
    .locals 0

    .line 75
    iput p1, p0, Lcom/radaee/reader/GLView;->m_view_mode:I

    return p1
.end method

.method static synthetic access$200(Lcom/radaee/reader/GLView;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_hold_docy:I

    return p0
.end method

.method static synthetic access$2000(Lcom/radaee/reader/GLView;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_page_gap:I

    return p0
.end method

.method static synthetic access$202(Lcom/radaee/reader/GLView;I)I
    .locals 0

    .line 75
    iput p1, p0, Lcom/radaee/reader/GLView;->m_hold_docy:I

    return p1
.end method

.method static synthetic access$2100(Lcom/radaee/reader/GLView;)Lcom/radaee/view/GLLayout$PDFPos;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/radaee/reader/GLView;->m_save_pos:Lcom/radaee/view/GLLayout$PDFPos;

    return-object p0
.end method

.method static synthetic access$2102(Lcom/radaee/reader/GLView;Lcom/radaee/view/GLLayout$PDFPos;)Lcom/radaee/view/GLLayout$PDFPos;
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_save_pos:Lcom/radaee/view/GLLayout$PDFPos;

    return-object p1
.end method

.method static synthetic access$2200(Lcom/radaee/reader/GLView;)V
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/radaee/reader/GLView;->notify_init()V

    return-void
.end method

.method static synthetic access$2300(Lcom/radaee/reader/GLView;)Lcom/radaee/annotui/UIAnnotPopEdit;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/radaee/reader/GLView;->m_pEdit:Lcom/radaee/annotui/UIAnnotPopEdit;

    return-object p0
.end method

.method static synthetic access$2400(Lcom/radaee/reader/GLView;)F
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_hold_x:F

    return p0
.end method

.method static synthetic access$2402(Lcom/radaee/reader/GLView;F)F
    .locals 0

    .line 75
    iput p1, p0, Lcom/radaee/reader/GLView;->m_hold_x:F

    return p1
.end method

.method static synthetic access$2500(Lcom/radaee/reader/GLView;)F
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_hold_y:F

    return p0
.end method

.method static synthetic access$2502(Lcom/radaee/reader/GLView;F)F
    .locals 0

    .line 75
    iput p1, p0, Lcom/radaee/reader/GLView;->m_hold_y:F

    return p1
.end method

.method static synthetic access$2600(Lcom/radaee/reader/GLView;)Lcom/radaee/view/GLLayout$PDFPos;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/radaee/reader/GLView;->m_zoom_pos:Lcom/radaee/view/GLLayout$PDFPos;

    return-object p0
.end method

.method static synthetic access$2602(Lcom/radaee/reader/GLView;Lcom/radaee/view/GLLayout$PDFPos;)Lcom/radaee/view/GLLayout$PDFPos;
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_zoom_pos:Lcom/radaee/view/GLLayout$PDFPos;

    return-object p1
.end method

.method static synthetic access$2700(Lcom/radaee/reader/GLView;)F
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_zoom_scale:F

    return p0
.end method

.method static synthetic access$2800(Lcom/radaee/reader/GLView;)F
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_zoom_dis0:F

    return p0
.end method

.method static synthetic access$2900()I
    .locals 1

    .line 75
    sget v0, Lcom/radaee/reader/GLView;->tmp_idx:I

    return v0
.end method

.method static synthetic access$2908()I
    .locals 2

    .line 75
    sget v0, Lcom/radaee/reader/GLView;->tmp_idx:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/radaee/reader/GLView;->tmp_idx:I

    return v0
.end method

.method static synthetic access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/radaee/reader/GLView;)[F
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    return-object p0
.end method

.method static synthetic access$402(Lcom/radaee/reader/GLView;[F)[F
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    return-object p1
.end method

.method static synthetic access$500(Lcom/radaee/reader/GLView;)Z
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/radaee/reader/GLView;->executeAnnotJS()Z

    move-result p0

    return p0
.end method

.method static synthetic access$600(Lcom/radaee/reader/GLView;)Landroid/widget/PopupWindow;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/radaee/reader/GLView;->m_pCombo:Landroid/widget/PopupWindow;

    return-object p0
.end method

.method static synthetic access$602(Lcom/radaee/reader/GLView;Landroid/widget/PopupWindow;)Landroid/widget/PopupWindow;
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_pCombo:Landroid/widget/PopupWindow;

    return-object p1
.end method

.method static synthetic access$700(Lcom/radaee/reader/GLView;F)I
    .locals 0

    .line 75
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->d(F)I

    move-result p0

    return p0
.end method

.method static synthetic access$800(Lcom/radaee/reader/GLView;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_combo_item:I

    return p0
.end method

.method static synthetic access$802(Lcom/radaee/reader/GLView;I)I
    .locals 0

    .line 75
    iput p1, p0, Lcom/radaee/reader/GLView;->m_combo_item:I

    return p1
.end method

.method static synthetic access$900(Lcom/radaee/reader/GLView;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/radaee/reader/GLView;->m_edit_type:I

    return p0
.end method

.method static synthetic access$902(Lcom/radaee/reader/GLView;I)I
    .locals 0

    .line 75
    iput p1, p0, Lcom/radaee/reader/GLView;->m_edit_type:I

    return p1
.end method

.method private allowDragAnnot(Lcom/radaee/pdf/Page$Annotation;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 3156
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

.method private clearAnnotState()V
    .locals 1

    const/4 v0, 0x0

    .line 502
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 503
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    .line 504
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    const/4 v0, 0x0

    .line 505
    iput v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    return-void
.end method

.method private d(F)I
    .locals 1

    .line 3150
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private static dp2px(Landroid/content/Context;F)I
    .locals 0

    .line 1948
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, p0

    float-to-int p0, p1

    return p0
.end method

.method private draw4DragPoint(Landroid/graphics/Canvas;FFFF)V
    .locals 2

    .line 3182
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    const v1, -0x66aaaaab

    .line 3183
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v1, 0x1

    .line 3184
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 3185
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v1, 0x3f800000    # 1.0f

    .line 3186
    invoke-direct {p0, v1}, Lcom/radaee/reader/GLView;->d(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 3187
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/radaee/reader/GLView;->drawDragPoint(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    .line 3188
    invoke-direct {p0, p1, p2, p5, v0}, Lcom/radaee/reader/GLView;->drawDragPoint(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    .line 3189
    invoke-direct {p0, p1, p4, p3, v0}, Lcom/radaee/reader/GLView;->drawDragPoint(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    .line 3190
    invoke-direct {p0, p1, p4, p5, v0}, Lcom/radaee/reader/GLView;->drawDragPoint(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawDragPoint(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V
    .locals 1

    const/high16 v0, 0x40a00000    # 5.0f

    .line 3194
    invoke-direct {p0, v0}, Lcom/radaee/reader/GLView;->d(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, p2, p3, v0, p4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v0, 0x40e00000    # 7.0f

    .line 3195
    invoke-direct {p0, v0}, Lcom/radaee/reader/GLView;->d(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, p2, p3, v0, p4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private executeAnnotJS()Z
    .locals 4

    .line 3028
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetJS()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 3029
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetJS()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/radaee/reader/GLView;->runJS(Ljava/lang/String;)V

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 3032
    :goto_0
    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v3, v1}, Lcom/radaee/pdf/Page$Annotation;->GetAdditionalJS(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 3033
    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v3, v1}, Lcom/radaee/pdf/Page$Annotation;->GetAdditionalJS(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/radaee/reader/GLView;->runJS(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    :cond_1
    if-lez v0, :cond_2

    return v1

    :cond_2
    return v2
.end method

.method private getOtherLetterFont()Lcom/radaee/pdf/Document$DocFont;
    .locals 3

    .line 3222
    invoke-static {}, Lcom/radaee/pdf/Global;->getNotoCjkFontName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 3224
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v2, v0, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 3225
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "NotoSansCJK-Regular"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_1
    if-nez v0, :cond_2

    .line 3226
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "NotoSerifCJK-Regular"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_2
    if-nez v0, :cond_3

    .line 3227
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "Noto Sans CJK SC Regular"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_3
    if-nez v0, :cond_4

    .line 3228
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "DroidSansChinese"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_4
    if-nez v0, :cond_5

    .line 3229
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "DroidSansFallback"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_5
    if-nez v0, :cond_6

    .line 3230
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "Arimo"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_6
    if-nez v0, :cond_7

    .line 3231
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "Roboto-Regular"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_7
    return-object v0
.end method

.method private inDragArea(FF)Z
    .locals 7

    .line 3171
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 3173
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

    .line 3175
    :cond_1
    aget v0, v0, v5

    invoke-direct {p0, p1, p2, v2, v0}, Lcom/radaee/reader/GLView;->inDragPoint(FFFF)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v2, v0, v1

    aget v0, v0, v4

    .line 3176
    invoke-direct {p0, p1, p2, v2, v0}, Lcom/radaee/reader/GLView;->inDragPoint(FFFF)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v2, v0, v3

    aget v0, v0, v5

    .line 3177
    invoke-direct {p0, p1, p2, v2, v0}, Lcom/radaee/reader/GLView;->inDragPoint(FFFF)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v2, v0, v3

    aget v0, v0, v4

    .line 3178
    invoke-direct {p0, p1, p2, v2, v0}, Lcom/radaee/reader/GLView;->inDragPoint(FFFF)Z

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

    .line 3163
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-direct {p0, v0}, Lcom/radaee/reader/GLView;->allowDragAnnot(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    sub-float/2addr p3, p1

    .line 3165
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p1

    sub-float/2addr p4, p2

    .line 3166
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p2

    const/high16 p3, 0x41700000    # 15.0f

    .line 3167
    invoke-direct {p0, p3}, Lcom/radaee/reader/GLView;->d(F)I

    move-result p4

    int-to-float p4, p4

    cmpg-float p1, p1, p4

    if-gez p1, :cond_1

    invoke-direct {p0, p3}, Lcom/radaee/reader/GLView;->d(F)I

    move-result p1

    int-to-float p1, p1

    cmpg-float p1, p2, p1

    if-gez p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method private init(Landroid/content/Context;)V
    .locals 10

    .line 531
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/radaee/reader/GLView$PDFGestureListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/radaee/reader/GLView$PDFGestureListener;-><init>(Lcom/radaee/reader/GLView;Lcom/radaee/reader/GLView$1;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_gesture:Landroid/view/GestureDetector;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/16 v4, 0x8

    const/16 v5, 0x8

    const/16 v6, 0x8

    const/16 v7, 0x8

    move-object v3, p0

    .line 534
    invoke-virtual/range {v3 .. v9}, Lcom/radaee/reader/GLView;->setEGLConfigChooser(IIIIII)V

    .line 535
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    const/4 v0, -0x3

    invoke-interface {p1, v0}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 536
    iput-object v2, v3, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    .line 538
    new-instance p1, Lcom/radaee/reader/GLView$2;

    invoke-direct {p1, p0}, Lcom/radaee/reader/GLView$2;-><init>(Lcom/radaee/reader/GLView;)V

    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    return-void
.end method

.method private declared-synchronized notify_init()V
    .locals 1

    monitor-enter p0

    .line 726
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/reader/GLView;->is_waitting:Z

    if-eqz v0, :cond_0

    .line 727
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 729
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->is_notified:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 730
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

.method private onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1699
    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    .line 1700
    sget-object v0, Lcom/radaee/pdf/Global;->g_annot_def_author:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1701
    sget-object v0, Lcom/radaee/pdf/Global;->g_annot_def_author:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetPopupLabel(Ljava/lang/String;)Z

    :cond_0
    return-void
.end method

.method private onDrawAnnot(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1776
    iget v1, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v2, 0x64

    if-ne v1, v2, :cond_0

    sget-boolean v1, Lcom/radaee/pdf/Global;->g_highlight_annotation:Z

    if-eqz v1, :cond_0

    .line 1778
    new-instance v7, Landroid/graphics/Paint;

    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    .line 1779
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v1, 0x40000000    # 2.0f

    .line 1780
    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/16 v1, 0x80

    const/4 v8, 0x0

    .line 1781
    invoke-virtual {v7, v1, v8, v8, v8}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 1782
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v3, v1, v8

    const/4 v9, 0x1

    aget v4, v1, v9

    const/4 v10, 0x2

    aget v5, v1, v10

    const/4 v11, 0x3

    aget v6, v1, v11

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1786
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-direct {p0, v1}, Lcom/radaee/reader/GLView;->allowDragAnnot(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1787
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v2, v1, v8

    aget v3, v1, v9

    aget v4, v1, v10

    aget v5, v1, v11

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/radaee/reader/GLView;->draw4DragPoint(Landroid/graphics/Canvas;FFFF)V

    :cond_0
    return-void
.end method

.method private onDrawEditbox(Landroid/graphics/Canvas;)V
    .locals 14

    .line 1873
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v0, :cond_2

    .line 1874
    array-length v0, v0

    .line 1876
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 1877
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v1, 0x40400000    # 3.0f

    .line 1878
    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1879
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

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_0
    if-ge v8, v0, :cond_2

    const/4 v1, 0x4

    .line 1882
    new-array v1, v1, [F

    .line 1883
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v3, v2, v8

    add-int/lit8 v4, v8, 0x2

    aget v5, v2, v4

    const/4 v9, 0x2

    cmpl-float v10, v3, v5

    if-lez v10, :cond_0

    .line 1884
    aput v5, v1, v7

    .line 1885
    aget v3, v2, v8

    aput v3, v1, v9

    goto :goto_1

    .line 1887
    :cond_0
    aput v3, v1, v7

    .line 1888
    aget v3, v2, v4

    aput v3, v1, v9

    :goto_1
    add-int/lit8 v3, v8, 0x1

    .line 1890
    aget v4, v2, v3

    add-int/lit8 v5, v8, 0x3

    aget v10, v2, v5

    const/4 v11, 0x3

    const/4 v12, 0x1

    cmpl-float v13, v4, v10

    if-lez v13, :cond_1

    .line 1891
    aput v10, v1, v12

    .line 1892
    aget v2, v2, v3

    aput v2, v1, v11

    goto :goto_2

    .line 1894
    :cond_1
    aput v4, v1, v12

    .line 1895
    aget v2, v2, v5

    aput v2, v1, v11

    .line 1897
    :goto_2
    aget v2, v1, v7

    aget v3, v1, v12

    aget v4, v1, v9

    aget v5, v1, v11

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v8, v8, 0x4

    goto :goto_0

    :cond_2
    return-void
.end method

.method private onDrawEllipse(Landroid/graphics/Canvas;)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1903
    iget v2, v0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v3, 0x5

    if-ne v2, v3, :cond_2

    iget-object v2, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v2, :cond_2

    .line 1904
    array-length v2, v2

    .line 1906
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 1907
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 1908
    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1909
    sget v5, Lcom/radaee/pdf/Global;->inkWidth:F

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1910
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

    .line 1912
    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1913
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

    .line 1915
    sget v5, Lcom/radaee/pdf/Global;->g_oval_annot_width:F

    const/high16 v6, 0x3f000000    # 0.5f

    mul-float v5, v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_0
    if-ge v7, v2, :cond_2

    const/4 v8, 0x4

    .line 1917
    new-array v8, v8, [F

    .line 1918
    iget-object v9, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v10, v9, v7

    add-int/lit8 v11, v7, 0x2

    aget v12, v9, v11

    const/4 v13, 0x2

    cmpl-float v14, v10, v12

    if-lez v14, :cond_0

    .line 1919
    aput v12, v8, v6

    .line 1920
    aget v10, v9, v7

    aput v10, v8, v13

    goto :goto_1

    .line 1922
    :cond_0
    aput v10, v8, v6

    .line 1923
    aget v10, v9, v11

    aput v10, v8, v13

    :goto_1
    add-int/lit8 v10, v7, 0x1

    .line 1925
    aget v11, v9, v10

    add-int/lit8 v12, v7, 0x3

    aget v14, v9, v12

    const/4 v15, 0x3

    const/16 v16, 0x1

    cmpl-float v17, v11, v14

    if-lez v17, :cond_1

    .line 1926
    aput v14, v8, v16

    .line 1927
    aget v9, v9, v10

    aput v9, v8, v15

    goto :goto_2

    .line 1929
    :cond_1
    aput v11, v8, v16

    .line 1930
    aget v9, v9, v12

    aput v9, v8, v15

    .line 1932
    :goto_2
    new-instance v9, Landroid/graphics/RectF;

    invoke-direct {v9}, Landroid/graphics/RectF;-><init>()V

    .line 1933
    aget v10, v8, v6

    iput v10, v9, Landroid/graphics/RectF;->left:F

    .line 1934
    aget v10, v8, v16

    iput v10, v9, Landroid/graphics/RectF;->top:F

    .line 1935
    aget v10, v8, v13

    iput v10, v9, Landroid/graphics/RectF;->right:F

    .line 1936
    aget v8, v8, v15

    iput v8, v9, Landroid/graphics/RectF;->bottom:F

    .line 1937
    invoke-virtual {v1, v9, v3}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1938
    iget v8, v9, Landroid/graphics/RectF;->left:F

    add-float/2addr v8, v5

    iput v8, v9, Landroid/graphics/RectF;->left:F

    .line 1939
    iget v8, v9, Landroid/graphics/RectF;->top:F

    add-float/2addr v8, v5

    iput v8, v9, Landroid/graphics/RectF;->top:F

    .line 1940
    iget v8, v9, Landroid/graphics/RectF;->right:F

    sub-float/2addr v8, v5

    iput v8, v9, Landroid/graphics/RectF;->right:F

    .line 1941
    iget v8, v9, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v8, v5

    iput v8, v9, Landroid/graphics/RectF;->bottom:F

    .line 1942
    invoke-virtual {v1, v9, v4}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    add-int/lit8 v7, v7, 0x4

    goto :goto_0

    :cond_2
    return-void
.end method

.method private onDrawLine(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1826
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    const/16 v1, 0x47

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v0, :cond_1

    .line 1827
    array-length v0, v0

    .line 1829
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 1830
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1831
    sget v1, Lcom/radaee/pdf/Global;->inkWidth:F

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1832
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

    .line 1835
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

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

.method private onDrawPolygon(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1952
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    if-nez v0, :cond_0

    goto :goto_0

    .line 1953
    :cond_0
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 1954
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1955
    sget v0, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v0, v0, 0x18

    and-int/lit16 v0, v0, 0xff

    sget v1, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v1, v1, 0x10

    and-int/lit16 v1, v1, 0xff

    sget v2, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v2, v2, 0x8

    and-int/lit16 v2, v2, 0xff

    sget v3, Lcom/radaee/pdf/Global;->inkColor:I

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 1957
    sget v0, Lcom/radaee/pdf/Global;->g_line_annot_width:F

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1958
    sget-object v0, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 1959
    sget-object v0, Landroid/graphics/Paint$Join;->BEVEL:Landroid/graphics/Paint$Join;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 1960
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v1, v6}, Lcom/radaee/pdf/Path;->OnDraw(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    .line 1962
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1963
    sget v0, Lcom/radaee/pdf/Global;->fillColor:I

    shr-int/lit8 v0, v0, 0x18

    and-int/lit16 v0, v0, 0xff

    sget v2, Lcom/radaee/pdf/Global;->fillColor:I

    shr-int/lit8 v2, v2, 0x10

    and-int/lit16 v2, v2, 0xff

    sget v3, Lcom/radaee/pdf/Global;->fillColor:I

    shr-int/lit8 v3, v3, 0x8

    and-int/lit16 v3, v3, 0xff

    sget v4, Lcom/radaee/pdf/Global;->fillColor:I

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v6, v0, v2, v3, v4}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 1965
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {v0}, Lcom/radaee/pdf/Path;->GetNodeCount()I

    move-result v0

    const/4 v2, 0x2

    if-le v0, v2, :cond_1

    .line 1966
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {v0, p1, v1, v1, v6}, Lcom/radaee/pdf/Path;->OnDraw(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    .line 1967
    :cond_1
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v2, 0x40800000    # 4.0f

    invoke-static {v0, v2}, Lcom/radaee/reader/GLView;->dp2px(Landroid/content/Context;F)I

    move-result v5

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Lcom/radaee/pdf/Path;->onDrawPoint(Landroid/graphics/Canvas;FFILandroid/graphics/Paint;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private onDrawPolyline(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1972
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v1, 0xb

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    if-nez v0, :cond_0

    goto :goto_0

    .line 1973
    :cond_0
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 1974
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1975
    sget v0, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v0, v0, 0x18

    and-int/lit16 v0, v0, 0xff

    sget v1, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v1, v1, 0x10

    and-int/lit16 v1, v1, 0xff

    sget v2, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v2, v2, 0x8

    and-int/lit16 v2, v2, 0xff

    sget v3, Lcom/radaee/pdf/Global;->inkColor:I

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 1977
    sget v0, Lcom/radaee/pdf/Global;->g_line_annot_width:F

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1978
    sget-object v0, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 1979
    sget-object v0, Landroid/graphics/Paint$Join;->BEVEL:Landroid/graphics/Paint$Join;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 1980
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v1, v6}, Lcom/radaee/pdf/Path;->OnDraw(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    .line 1982
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1983
    sget v0, Lcom/radaee/pdf/Global;->fillColor:I

    shr-int/lit8 v0, v0, 0x18

    and-int/lit16 v0, v0, 0xff

    sget v1, Lcom/radaee/pdf/Global;->fillColor:I

    shr-int/lit8 v1, v1, 0x10

    and-int/lit16 v1, v1, 0xff

    sget v2, Lcom/radaee/pdf/Global;->fillColor:I

    shr-int/lit8 v2, v2, 0x8

    and-int/lit16 v2, v2, 0xff

    sget v3, Lcom/radaee/pdf/Global;->fillColor:I

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 1985
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v2, 0x40800000    # 4.0f

    invoke-static {v0, v2}, Lcom/radaee/reader/GLView;->dp2px(Landroid/content/Context;F)I

    move-result v5

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Lcom/radaee/pdf/Path;->onDrawPoint(Landroid/graphics/Canvas;FFILandroid/graphics/Paint;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private onDrawRect(Landroid/graphics/Canvas;)V
    .locals 17

    move-object/from16 v0, p0

    .line 1792
    iget v1, v0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_2

    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v1, :cond_2

    .line 1793
    array-length v1, v1

    .line 1795
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    .line 1796
    new-instance v14, Landroid/graphics/Paint;

    invoke-direct {v14}, Landroid/graphics/Paint;-><init>()V

    .line 1797
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1798
    sget v3, Lcom/radaee/pdf/Global;->inkWidth:F

    invoke-virtual {v8, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1799
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

    .line 1801
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v14, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1802
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

    .line 1805
    new-array v10, v2, [F

    .line 1806
    iget-object v3, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v4, v3, v9

    add-int/lit8 v5, v9, 0x2

    aget v6, v3, v5

    const/4 v11, 0x2

    cmpl-float v7, v4, v6

    if-lez v7, :cond_0

    .line 1807
    aput v6, v10, v15

    .line 1808
    aget v4, v3, v9

    aput v4, v10, v11

    goto :goto_1

    .line 1810
    :cond_0
    aput v4, v10, v15

    .line 1811
    aget v4, v3, v5

    aput v4, v10, v11

    :goto_1
    add-int/lit8 v4, v9, 0x1

    .line 1813
    aget v5, v3, v4

    add-int/lit8 v6, v9, 0x3

    aget v7, v3, v6

    const/4 v12, 0x3

    const/4 v13, 0x1

    cmpl-float v16, v5, v7

    if-lez v16, :cond_1

    .line 1814
    aput v7, v10, v13

    .line 1815
    aget v3, v3, v4

    aput v3, v10, v12

    goto :goto_2

    .line 1817
    :cond_1
    aput v5, v10, v13

    .line 1818
    aget v3, v3, v6

    aput v3, v10, v12

    .line 1820
    :goto_2
    aget v4, v10, v15

    aget v5, v10, v13

    aget v6, v10, v11

    aget v7, v10, v12

    move-object/from16 v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1821
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
    .locals 8

    .line 1730
    :try_start_0
    iget v0, p0, Lcom/radaee/reader/GLView;->force_sel_start:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_7

    .line 1731
    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_annot_page:Lcom/radaee/view/GLPage;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFGetCurrPage()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 1732
    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    invoke-virtual {v0}, Lcom/radaee/view/VSel;->Clear()V

    const/4 v0, 0x0

    .line 1733
    iput-object v0, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    .line 1735
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFGetCurrPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/reader/GLView;->tts_annot_page:Lcom/radaee/view/GLPage;

    if-nez v0, :cond_1

    goto/16 :goto_0

    .line 1738
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    if-nez v0, :cond_2

    .line 1739
    new-instance v0, Lcom/radaee/view/VSel;

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFGetCurrPage()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/radaee/view/VSel;-><init>(Lcom/radaee/pdf/Page;)V

    iput-object v0, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    .line 1740
    :cond_2
    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    iget v1, p0, Lcom/radaee/reader/GLView;->force_sel_start:I

    iput v1, v0, Lcom/radaee/view/VSel;->m_index1:I

    .line 1741
    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    iget v1, p0, Lcom/radaee/reader/GLView;->force_sel_end:I

    iput v1, v0, Lcom/radaee/view/VSel;->m_index2:I

    .line 1743
    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_annot_page:Lcom/radaee/view/GLPage;

    if-nez v0, :cond_3

    goto/16 :goto_0

    .line 1745
    :cond_3
    invoke-virtual {v0, v2}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v0

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v1}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v1

    sub-int v6, v0, v1

    .line 1746
    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_annot_page:Lcom/radaee/view/GLPage;

    if-nez v0, :cond_4

    goto/16 :goto_0

    .line 1748
    :cond_4
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v5

    .line 1749
    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0, v5}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result v0

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v1}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v1

    sub-int v7, v0, v1

    .line 1750
    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetScale()F

    move-result v4

    .line 1752
    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    if-nez v0, :cond_5

    goto :goto_0

    .line 1754
    :cond_5
    iget-boolean v0, v0, Lcom/radaee/view/VSel;->m_ok:Z

    if-nez v0, :cond_6

    .line 1755
    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    iget-object v0, v0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1756
    iget-object v0, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/radaee/view/VSel;->m_ok:Z

    .line 1758
    :cond_6
    iget-object v2, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/radaee/view/VSel;->DrawSel(Landroid/graphics/Canvas;FFII)V

    .line 1759
    iget-object p1, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    if-eqz p1, :cond_8

    .line 1760
    iget-object p1, p1, Lcom/radaee/view/VSel;->drawPara:Landroid/graphics/RectF;

    iput-object p1, p0, Lcom/radaee/reader/GLView;->ttsPara:Landroid/graphics/RectF;

    return-void

    :cond_7
    move-object v1, p1

    .line 1762
    iget p1, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_8

    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    if-eqz p1, :cond_8

    .line 1763
    invoke-virtual {p1, v2}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result p1

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v0

    sub-int v4, p1, v0

    .line 1764
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v3

    .line 1765
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {p1, v3}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result p1

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v0

    sub-int v5, p1, v0

    .line 1766
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetScale()F

    move-result v2

    .line 1767
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    invoke-virtual/range {v0 .. v5}, Lcom/radaee/view/VSel;->DrawSel(Landroid/graphics/Canvas;FFII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 1770
    const-string v0, "MR2"

    const-string v1, "####ERROR#### PDF onDrawSelect"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1771
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

    .line 1473
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v1, 0x64

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 1474
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

    .line 1491
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->IsLocked()Z

    move-result v0

    if-nez v0, :cond_c

    .line 1492
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 1493
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    .line 1494
    iget v5, p0, Lcom/radaee/reader/GLView;->m_annot_x0:F

    sub-float v5, v0, v5

    .line 1495
    iget v6, p0, Lcom/radaee/reader/GLView;->m_annot_y0:F

    sub-float v6, p1, v6

    .line 1496
    iget-object v7, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v8, v7, v2

    aget v7, v7, v4

    invoke-direct {p0, v0, p1, v8, v7}, Lcom/radaee/reader/GLView;->inDragPoint(FFFF)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1497
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    aget v1, v0, v2

    add-float/2addr v1, v5

    aput v1, p1, v2

    .line 1498
    aget v0, v0, v4

    add-float/2addr v0, v6

    aput v0, p1, v4

    goto :goto_0

    .line 1499
    :cond_2
    iget-object v7, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v8, v7, v2

    aget v7, v7, v1

    invoke-direct {p0, v0, p1, v8, v7}, Lcom/radaee/reader/GLView;->inDragPoint(FFFF)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1500
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    aget v3, v0, v2

    add-float/2addr v3, v5

    aput v3, p1, v2

    .line 1501
    aget v0, v0, v1

    add-float/2addr v0, v6

    aput v0, p1, v1

    goto :goto_0

    .line 1502
    :cond_3
    iget-object v7, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v8, v7, v3

    aget v7, v7, v4

    invoke-direct {p0, v0, p1, v8, v7}, Lcom/radaee/reader/GLView;->inDragPoint(FFFF)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1503
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    aget v1, v0, v4

    add-float/2addr v1, v6

    aput v1, p1, v4

    .line 1504
    aget v0, v0, v3

    add-float/2addr v0, v5

    aput v0, p1, v3

    goto :goto_0

    .line 1505
    :cond_4
    iget-object v7, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v8, v7, v3

    aget v7, v7, v1

    invoke-direct {p0, v0, p1, v8, v7}, Lcom/radaee/reader/GLView;->inDragPoint(FFFF)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 1506
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    aget v2, v0, v3

    add-float/2addr v2, v5

    aput v2, p1, v3

    .line 1507
    aget v0, v0, v1

    add-float/2addr v0, v6

    aput v0, p1, v1

    goto :goto_0

    .line 1509
    :cond_5
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    aget v7, v0, v2

    add-float/2addr v7, v5

    aput v7, p1, v2

    .line 1510
    aget v2, v0, v4

    add-float/2addr v2, v6

    aput v2, p1, v4

    .line 1511
    aget v2, v0, v3

    add-float/2addr v2, v5

    aput v2, p1, v3

    .line 1512
    aget v0, v0, v1

    add-float/2addr v0, v6

    aput v0, p1, v1

    .line 1514
    :goto_0
    iput-boolean v4, p0, Lcom/radaee/reader/GLView;->annotRectChanged:Z

    goto/16 :goto_2

    .line 1519
    :cond_6
    iget-boolean v0, p0, Lcom/radaee/reader/GLView;->annotRectChanged:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->IsLocked()Z

    move-result v0

    if-nez v0, :cond_9

    .line 1520
    iput-boolean v2, p0, Lcom/radaee/reader/GLView;->annotRectChanged:Z

    .line 1521
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 1522
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    .line 1523
    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    float-to-int v0, v0

    float-to-int p1, p1

    invoke-virtual {v5, v0, p1}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    .line 1528
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    iget v5, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    if-ne v0, v5, :cond_7

    .line 1529
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v5, v5, v2

    iget-object v6, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v0, v5, v6}, Lcom/radaee/view/GLPage;->ToPDFX(FF)F

    move-result v0

    aput v0, p1, v2

    .line 1530
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v5, v5, v1

    iget-object v6, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v0, v5, v6}, Lcom/radaee/view/GLPage;->ToPDFY(FF)F

    move-result v0

    aput v0, p1, v4

    .line 1531
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v5, v5, v3

    iget-object v6, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v0, v5, v6}, Lcom/radaee/view/GLPage;->ToPDFX(FF)F

    move-result v0

    aput v0, p1, v3

    .line 1532
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v5, v5, v4

    iget-object v6, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v0, v5, v6}, Lcom/radaee/view/GLPage;->ToPDFY(FF)F

    move-result v0

    aput v0, p1, v1

    .line 1534
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    .line 1536
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    aget v2, v0, v2

    aget v5, v0, v4

    aget v3, v0, v3

    aget v0, v0, v1

    invoke-virtual {p1, v2, v5, v3, v0}, Lcom/radaee/pdf/Page$Annotation;->SetRect(FFFF)V

    .line 1537
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    .line 1538
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {p1, v0}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 1539
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_9

    .line 1540
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    goto/16 :goto_1

    .line 1542
    :cond_7
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget p1, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v0, p1}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object p1

    .line 1543
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v5

    invoke-virtual {v0, v5}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 1545
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1546
    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    iget-object v6, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v6, v6, v2

    iget-object v7, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v7}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {p1, v6, v7}, Lcom/radaee/view/GLPage;->ToPDFX(FF)F

    move-result v6

    aput v6, v5, v2

    .line 1547
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v5, v5, v1

    iget-object v6, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p1, v5, v6}, Lcom/radaee/view/GLPage;->ToPDFY(FF)F

    move-result v5

    aput v5, v2, v4

    .line 1548
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v5, v5, v3

    iget-object v6, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p1, v5, v6}, Lcom/radaee/view/GLPage;->ToPDFX(FF)F

    move-result v5

    aput v5, v2, v3

    .line 1549
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v3, v3, v4

    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v5}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p1, v3, v5}, Lcom/radaee/view/GLPage;->ToPDFY(FF)F

    move-result v3

    aput v3, v2, v1

    .line 1551
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    .line 1553
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    invoke-virtual {v1, v0, v2}, Lcom/radaee/pdf/Page$Annotation;->MoveToPage(Lcom/radaee/pdf/Page;[F)Z

    .line 1554
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    .line 1556
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 1558
    :cond_8
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 1559
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    invoke-virtual {v0, p1, v1}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;[F)V

    .line 1560
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v0, :cond_9

    .line 1561
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v1}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 1562
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result p1

    invoke-interface {v0, p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 1566
    :cond_9
    :goto_1
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFEndAnnot()V

    goto :goto_2

    .line 1476
    :cond_a
    iput-boolean v2, p0, Lcom/radaee/reader/GLView;->annotRectChanged:Z

    .line 1477
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/reader/GLView;->m_annot_x0:F

    .line 1478
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/reader/GLView;->m_annot_y0:F

    .line 1481
    iget v0, p0, Lcom/radaee/reader/GLView;->m_annot_x0:F

    invoke-direct {p0, v0, p1}, Lcom/radaee/reader/GLView;->inDragArea(FF)Z

    move-result p1

    if-eqz p1, :cond_b

    const/4 p1, 0x4

    .line 1482
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    .line 1483
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    aget v5, v0, v2

    aput v5, p1, v2

    .line 1484
    aget v2, v0, v4

    aput v2, p1, v4

    .line 1485
    aget v2, v0, v3

    aput v2, p1, v3

    .line 1486
    aget v0, v0, v1

    aput v0, p1, v1

    goto :goto_2

    :cond_b
    const/4 p1, 0x0

    .line 1488
    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect0:[F

    .line 1570
    :cond_c
    :goto_2
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->doPostInvalidate()V

    return v4
.end method

.method private onTouchEditbox(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 978
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v1, 0x9

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 980
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v0, :cond_1

    array-length v0, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 983
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v3, 0x3

    const/4 v4, 0x1

    if-eqz v1, :cond_6

    const/4 v5, 0x2

    if-eq v1, v4, :cond_3

    if-eq v1, v5, :cond_2

    if-eq v1, v3, :cond_3

    goto/16 :goto_2

    .line 995
    :cond_2
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 996
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto/16 :goto_2

    .line 1000
    :cond_3
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    add-int/lit8 v6, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    aput v7, v1, v6

    .line 1001
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    .line 1002
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v1, v0, v2

    float-to-int v1, v1

    aget v0, v0, v4

    float-to-int v0, v0

    invoke-virtual {p1, v1, v0}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    .line 1003
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget p1, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v0, p1}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 1004
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_pg:Lcom/radaee/pdf/Page;

    .line 1005
    invoke-virtual {p0, v4}, Lcom/radaee/reader/GLView;->PDFSetEditbox(I)V

    .line 1007
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_pg:Lcom/radaee/pdf/Page;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1008
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_pg:Lcom/radaee/pdf/Page;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v0

    sub-int/2addr v0, v4

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 1009
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    .line 1010
    aget v0, p1, v4

    .line 1011
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    aget v6, p1, v2

    invoke-virtual {v1, v6}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v1

    iget-object v6, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v6

    sub-int/2addr v1, v6

    int-to-float v1, v1

    aput v1, p1, v2

    .line 1012
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    aget v2, p1, v3

    invoke-virtual {v1, v2}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result v1

    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v2}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    aput v1, p1, v4

    .line 1013
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    aget v2, p1, v5

    invoke-virtual {v1, v2}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v1

    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v2}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    aput v1, p1, v5

    .line 1014
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v1, v0}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result v0

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v1}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    aput v0, p1, v3

    .line 1015
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_4

    .line 1016
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-interface {p1, v0, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFAnnotTapped(ILcom/radaee/pdf/Page$Annotation;)V

    :cond_4
    const/16 p1, 0x64

    .line 1017
    iput p1, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 1019
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_pEdit:Lcom/radaee/annotui/UIAnnotPopEdit;

    if-nez p1, :cond_5

    new-instance p1, Lcom/radaee/annotui/UIAnnotPopEdit;

    invoke-direct {p1, p0}, Lcom/radaee/annotui/UIAnnotPopEdit;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_pEdit:Lcom/radaee/annotui/UIAnnotPopEdit;

    .line 1020
    :cond_5
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_pEdit:Lcom/radaee/annotui/UIAnnotPopEdit;

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v2}, Lcom/radaee/view/GLPage;->GetScale()F

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lcom/radaee/annotui/UIAnnotPopEdit;->update(Lcom/radaee/pdf/Page$Annotation;[FF)V

    .line 1021
    iput v4, p0, Lcom/radaee/reader/GLView;->m_edit_type:I

    .line 1022
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_pEdit:Lcom/radaee/annotui/UIAnnotPopEdit;

    new-instance v0, Lcom/radaee/reader/GLView$9;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$9;-><init>(Lcom/radaee/reader/GLView;)V

    invoke-virtual {p1, v0}, Lcom/radaee/annotui/UIAnnotPopEdit;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 1041
    new-instance p1, Lcom/radaee/reader/GLView$10;

    invoke-direct {p1, p0}, Lcom/radaee/reader/GLView$10;-><init>(Lcom/radaee/reader/GLView;)V

    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->post(Ljava/lang/Runnable;)Z

    goto :goto_2

    :cond_6
    add-int/lit8 v1, v0, 0x4

    .line 985
    new-array v1, v1, [F

    :goto_1
    if-ge v2, v0, :cond_7

    .line 987
    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v5, v5, v2

    aput v5, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 988
    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    aput v0, v1, v2

    add-int/lit8 v0, v2, 0x1

    .line 989
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    aput v5, v1, v0

    add-int/lit8 v0, v2, 0x2

    .line 990
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    aput v5, v1, v0

    add-int/2addr v2, v3

    .line 991
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v2

    .line 992
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 1052
    :goto_2
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_8

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_8
    return v4
.end method

.method private onTouchEllipse(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1442
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v1, 0x5

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 1444
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v0, :cond_1

    array-length v0, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1446
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

    .line 1458
    :cond_2
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 1459
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto :goto_2

    .line 1463
    :cond_3
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 1464
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto :goto_2

    :cond_4
    add-int/lit8 v1, v0, 0x4

    .line 1448
    new-array v1, v1, [F

    :goto_1
    if-ge v2, v0, :cond_5

    .line 1450
    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v5, v5, v2

    aput v5, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1451
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    aput v0, v1, v2

    add-int/lit8 v0, v2, 0x1

    .line 1452
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    aput v5, v1, v0

    add-int/lit8 v0, v2, 0x2

    .line 1453
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    aput v5, v1, v0

    add-int/2addr v2, v3

    .line 1454
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v2

    .line 1455
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 1467
    :goto_2
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_6
    return v4
.end method

.method private onTouchInk(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1352
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 v0, 0x1

    .line 1353
    sput-boolean v0, Lcom/radaee/reader/GLView;->inkStart:Z

    .line 1354
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    if-eqz v2, :cond_3

    if-eq v2, v0, :cond_2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_1

    if-eq v2, v1, :cond_2

    goto :goto_0

    .line 1363
    :cond_1
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v1, v2, p1}, Lcom/radaee/pdf/Ink;->OnMove(FF)V

    goto :goto_0

    .line 1367
    :cond_2
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v1, v2, p1}, Lcom/radaee/pdf/Ink;->OnUp(FF)V

    goto :goto_0

    .line 1356
    :cond_3
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    if-nez v1, :cond_4

    .line 1357
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v1

    .line 1358
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v1, v1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v2, v1}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 1360
    :cond_4
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v1, v2, p1}, Lcom/radaee/pdf/Ink;->OnDown(FF)V

    .line 1370
    :goto_0
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_5
    return v0
.end method

.method private onTouchLine(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1575
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v1, 0x7

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    const/16 v1, 0x47

    if-eq v0, v1, :cond_0

    return v2

    .line 1577
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v0, :cond_1

    array-length v0, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1579
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

    .line 1591
    :cond_2
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 1592
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto :goto_2

    .line 1596
    :cond_3
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 1597
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto :goto_2

    :cond_4
    add-int/lit8 v1, v0, 0x4

    .line 1581
    new-array v1, v1, [F

    :goto_1
    if-ge v2, v0, :cond_5

    .line 1583
    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v5, v5, v2

    aput v5, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1584
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    aput v0, v1, v2

    add-int/lit8 v0, v2, 0x1

    .line 1585
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    aput v5, v1, v0

    add-int/lit8 v0, v2, 0x2

    .line 1586
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    aput v5, v1, v0

    add-int/2addr v2, v3

    .line 1587
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v2

    .line 1588
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 1600
    :goto_2
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_6
    return v4
.end method

.method private onTouchNone(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1155
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 1156
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_gesture:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    return v2

    .line 1157
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_5

    if-eq v0, v2, :cond_4

    const/4 v3, 0x2

    if-eq v0, v3, :cond_3

    const/4 v4, 0x3

    if-eq v0, v4, :cond_4

    const/4 v4, 0x5

    if-eq v0, v4, :cond_2

    goto/16 :goto_0

    .line 1180
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-lt v0, v3, :cond_6

    .line 1181
    iput v2, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 1182
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    add-float/2addr v0, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v0, v3

    iput v0, p0, Lcom/radaee/reader/GLView;->m_hold_x:F

    .line 1183
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    add-float/2addr v0, v4

    div-float/2addr v0, v3

    iput v0, p0, Lcom/radaee/reader/GLView;->m_hold_y:F

    .line 1184
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 1185
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v1, p1

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    .line 1186
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result p1

    iput p1, p0, Lcom/radaee/reader/GLView;->m_zoom_dis0:F

    .line 1187
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p1}, Lcom/radaee/view/GLLayout;->vGetZoom()F

    move-result p1

    iput p1, p0, Lcom/radaee/reader/GLView;->m_zoom_scale:F

    .line 1188
    iget-object p1, p0, Lcom/radaee/reader/GLView;->OnZoomStart:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    .line 1189
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_6

    .line 1190
    invoke-interface {p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFZoomStart()V

    goto :goto_0

    .line 1166
    :cond_3
    iget-boolean v0, p0, Lcom/radaee/reader/GLView;->m_hold:Z

    if-eqz v0, :cond_6

    .line 1167
    iget-object v0, p0, Lcom/radaee/reader/GLView;->OnNoneMove:Lcom/radaee/reader/GLView$TouchRunnable;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/radaee/reader/GLView$TouchRunnable;->new_point(FF)V

    .line 1168
    iget-object p1, p0, Lcom/radaee/reader/GLView;->OnNoneMove:Lcom/radaee/reader/GLView$TouchRunnable;

    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 1173
    :cond_4
    iget-boolean v0, p0, Lcom/radaee/reader/GLView;->m_hold:Z

    if-eqz v0, :cond_6

    .line 1174
    iput-boolean v1, p0, Lcom/radaee/reader/GLView;->m_hold:Z

    .line 1175
    iget-object v0, p0, Lcom/radaee/reader/GLView;->OnNoneUp:Lcom/radaee/reader/GLView$TouchRunnable;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/radaee/reader/GLView$TouchRunnable;->new_point(FF)V

    .line 1176
    iget-object p1, p0, Lcom/radaee/reader/GLView;->OnNoneUp:Lcom/radaee/reader/GLView$TouchRunnable;

    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 1159
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/reader/GLView;->m_hold_x:F

    .line 1160
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/reader/GLView;->m_hold_y:F

    .line 1161
    iput-boolean v2, p0, Lcom/radaee/reader/GLView;->m_hold:Z

    .line 1162
    iget-object p1, p0, Lcom/radaee/reader/GLView;->OnNoneDown:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    .line 1163
    iput-object p1, p0, Lcom/radaee/reader/GLView;->vert_scroll_locked:Ljava/lang/Boolean;

    :cond_6
    :goto_0
    return v2
.end method

.method private onTouchNote(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1635
    iget p1, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v0, 0x6

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method private onTouchPolygon(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1374
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 1375
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    goto :goto_0

    .line 1378
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    if-nez v0, :cond_2

    .line 1379
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v0, v2, v3}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v0

    .line 1380
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v0, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v2, v0}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 1382
    :cond_2
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {v0}, Lcom/radaee/pdf/Path;->GetNodeCount()I

    move-result v0

    if-ge v0, v1, :cond_3

    .line 1383
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v2, p1}, Lcom/radaee/pdf/Path;->MoveTo(FF)V

    goto :goto_0

    .line 1385
    :cond_3
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v2, p1}, Lcom/radaee/pdf/Path;->LineTo(FF)V

    .line 1388
    :goto_0
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_4
    return v1
.end method

.method private onTouchPolyline(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1393
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v1, 0xb

    if-eq v0, v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 1394
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    goto :goto_0

    .line 1397
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    if-nez v0, :cond_2

    .line 1398
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v0, v2, v3}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v0

    .line 1399
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v0, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v2, v0}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 1401
    :cond_2
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {v0}, Lcom/radaee/pdf/Path;->GetNodeCount()I

    move-result v0

    if-ge v0, v1, :cond_3

    .line 1402
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v2, p1}, Lcom/radaee/pdf/Path;->MoveTo(FF)V

    goto :goto_0

    .line 1404
    :cond_3
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v2, p1}, Lcom/radaee/pdf/Path;->LineTo(FF)V

    .line 1407
    :goto_0
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_4
    return v1
.end method

.method private onTouchRect(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1412
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v1, 0x4

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 1414
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v0, :cond_1

    array-length v0, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1416
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

    .line 1428
    :cond_2
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 1429
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto :goto_2

    .line 1433
    :cond_3
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 1434
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto :goto_2

    :cond_4
    add-int/lit8 v1, v0, 0x4

    .line 1418
    new-array v1, v1, [F

    :goto_1
    if-ge v2, v0, :cond_5

    .line 1420
    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v5, v5, v2

    aput v5, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1421
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    aput v0, v1, v2

    add-int/lit8 v0, v2, 0x1

    .line 1422
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    aput v5, v1, v0

    add-int/lit8 v0, v2, 0x2

    .line 1423
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    aput v5, v1, v0

    add-int/2addr v2, v3

    .line 1424
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v2

    .line 1425
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 1437
    :goto_2
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_6
    return v4
.end method

.method private onTouchSelect(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1347
    iget p1, p0, Lcom/radaee/reader/GLView;->m_status:I

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

    .line 1605
    iget p1, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v0, 0x8

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method private onTouchZoom(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1217
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    return v1

    .line 1218
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v3, 0x5

    const/4 v4, 0x2

    if-eq v0, v2, :cond_4

    if-eq v0, v4, :cond_3

    const/4 v5, 0x3

    if-eq v0, v5, :cond_1

    const/4 v5, 0x6

    if-eq v0, v5, :cond_4

    goto/16 :goto_0

    .line 1251
    :cond_1
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    if-ne v0, v2, :cond_6

    .line 1252
    iget v0, p0, Lcom/radaee/reader/GLView;->m_view_mode:I

    if-ne v0, v3, :cond_2

    .line 1253
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 1254
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v3, p1

    mul-float v0, v0, v0

    mul-float v3, v3, v3

    add-float/2addr v0, v3

    .line 1255
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result p1

    .line 1256
    new-instance v0, Lcom/radaee/reader/GLView$18;

    invoke-direct {v0, p0, p1}, Lcom/radaee/reader/GLView$18;-><init>(Lcom/radaee/reader/GLView;F)V

    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    .line 1265
    :cond_2
    iput v1, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 1266
    iput-boolean v1, p0, Lcom/radaee/reader/GLView;->m_hold:Z

    .line 1267
    iget-object p1, p0, Lcom/radaee/reader/GLView;->OnZoomEnd:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    .line 1268
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_6

    .line 1269
    invoke-interface {p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFZoomEnd()V

    goto/16 :goto_0

    .line 1220
    :cond_3
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    if-ne v0, v2, :cond_6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-lt v0, v4, :cond_6

    iget v0, p0, Lcom/radaee/reader/GLView;->m_view_mode:I

    if-eq v0, v3, :cond_6

    .line 1221
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 1222
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v1, p1

    .line 1223
    iget-object p1, p0, Lcom/radaee/reader/GLView;->OnZoomMove:Lcom/radaee/reader/GLView$TouchRunnable;

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/radaee/reader/GLView$TouchRunnable;->new_point(FF)V

    .line 1224
    iget-object p1, p0, Lcom/radaee/reader/GLView;->OnZoomMove:Lcom/radaee/reader/GLView$TouchRunnable;

    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 1229
    :cond_4
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    if-ne v0, v2, :cond_6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ne v0, v4, :cond_6

    .line 1230
    iget v0, p0, Lcom/radaee/reader/GLView;->m_view_mode:I

    if-ne v0, v3, :cond_5

    .line 1231
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 1232
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v3, p1

    mul-float v0, v0, v0

    mul-float v3, v3, v3

    add-float/2addr v0, v3

    .line 1233
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result p1

    .line 1234
    new-instance v0, Lcom/radaee/reader/GLView$17;

    invoke-direct {v0, p0, p1}, Lcom/radaee/reader/GLView$17;-><init>(Lcom/radaee/reader/GLView;F)V

    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    .line 1243
    :cond_5
    iput v1, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 1244
    iput-boolean v1, p0, Lcom/radaee/reader/GLView;->m_hold:Z

    .line 1245
    iget-object p1, p0, Lcom/radaee/reader/GLView;->OnZoomEnd:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    .line 1246
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_6

    .line 1247
    invoke-interface {p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFZoomEnd()V

    :cond_6
    :goto_0
    return v2
.end method

.method private runJS(Ljava/lang/String;)V
    .locals 2

    .line 3041
    :try_start_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    new-instance v1, Lcom/radaee/reader/GLView$23;

    invoke-direct {v1, p0}, Lcom/radaee/reader/GLView$23;-><init>(Lcom/radaee/reader/GLView;)V

    invoke-virtual {v0, p1, v1}, Lcom/radaee/pdf/Document;->RunJS(Ljava/lang/String;Lcom/radaee/pdf/Document$PDFJSDelegate;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 3070
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method private declared-synchronized wait_init()V
    .locals 2

    monitor-enter p0

    .line 714
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/reader/GLView;->is_notified:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 715
    iput-boolean v1, p0, Lcom/radaee/reader/GLView;->is_notified:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 717
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->is_waitting:Z

    .line 718
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 719
    iput-boolean v1, p0, Lcom/radaee/reader/GLView;->is_waitting:Z
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

    .line 723
    :catch_0
    :goto_0
    monitor-exit p0

    return-void
.end method


# virtual methods
.method public BundleRestorePos(Landroid/os/Bundle;)V
    .locals 2

    .line 2856
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_2

    .line 2857
    new-instance v0, Lcom/radaee/view/GLLayout$PDFPos;

    invoke-direct {v0}, Lcom/radaee/view/GLLayout$PDFPos;-><init>()V

    .line 2858
    const-string v1, "view_page"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    .line 2859
    const-string v1, "view_x"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v1

    iput v1, v0, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    .line 2860
    const-string v1, "view_y"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result p1

    iput p1, v0, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    .line 2861
    iget p1, p0, Lcom/radaee/reader/GLView;->m_w:I

    if-lez p1, :cond_1

    iget p1, p0, Lcom/radaee/reader/GLView;->m_h:I

    if-gtz p1, :cond_0

    goto :goto_0

    .line 2864
    :cond_0
    new-instance p1, Lcom/radaee/reader/GLView$20;

    invoke-direct {p1, p0, v0}, Lcom/radaee/reader/GLView$20;-><init>(Lcom/radaee/reader/GLView;Lcom/radaee/view/GLLayout$PDFPos;)V

    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    return-void

    .line 2862
    :cond_1
    :goto_0
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_goto_pos:Lcom/radaee/view/GLLayout$PDFPos;

    :cond_2
    return-void
.end method

.method public BundleSavePos(Landroid/os/Bundle;)V
    .locals 3

    .line 2847
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 2848
    invoke-virtual {v0, v1, v1}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v0

    .line 2849
    const-string v1, "view_page"

    iget v2, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2850
    const-string v1, "view_x"

    iget v2, v0, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 2851
    const-string v1, "view_y"

    iget v0, v0, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    :cond_0
    return-void
.end method

.method public PDFCanSave()Z
    .locals 1

    .line 2973
    iget-boolean v0, p0, Lcom/radaee/reader/GLView;->mReadOnly:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/view/GLLayout;->vCanSave()Z

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

    .line 667
    new-instance v0, Lcom/radaee/reader/GLView$5;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$5;-><init>(Lcom/radaee/reader/GLView;)V

    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    .line 686
    monitor-enter p0

    .line 688
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 691
    :catchall_0
    :try_start_1
    monitor-exit p0

    return-void

    :catchall_1
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0
.end method

.method public PDFCloseOnUI()V
    .locals 0

    .line 663
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFCancelAnnot()V

    return-void
.end method

.method public PDFEndAnnot()V
    .locals 3

    .line 2647
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v1, 0x64

    if-eq v0, v1, :cond_0

    goto :goto_1

    .line 2648
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_aMenu:Lcom/radaee/annotui/UIAnnotMenu;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/radaee/annotui/UIAnnotMenu;->hide()V

    .line 2650
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_pg:Lcom/radaee/pdf/Page;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 2651
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 2652
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_pg:Lcom/radaee/pdf/Page;

    .line 2654
    :cond_2
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 2655
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    .line 2656
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 2657
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_3
    const/4 v0, 0x0

    .line 2658
    iput v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2660
    :try_start_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_pEdit:Lcom/radaee/annotui/UIAnnotPopEdit;

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/radaee/annotui/UIAnnotPopEdit;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_pEdit:Lcom/radaee/annotui/UIAnnotPopEdit;

    invoke-virtual {v0}, Lcom/radaee/annotui/UIAnnotPopEdit;->dismiss()V

    .line 2661
    :cond_4
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_pCombo:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_pCombo:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    .line 2664
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v0, :cond_6

    const/4 v2, -0x1

    .line 2665
    invoke-interface {v0, v2, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFAnnotTapped(ILcom/radaee/pdf/Page$Annotation;)V

    :cond_6
    :goto_1
    return-void
.end method

.method public final PDFFind(I)V
    .locals 1

    .line 2806
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0, p1}, Lcom/radaee/view/GLLayout;->vFind(I)I

    .line 2807
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method

.method public final PDFFindEnd()V
    .locals 1

    .line 2811
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0}, Lcom/radaee/view/GLLayout;->vFindEnd()V

    return-void
.end method

.method public final PDFFindStart(Ljava/lang/String;ZZ)V
    .locals 1

    .line 2802
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0, p1, p2, p3}, Lcom/radaee/view/GLLayout;->vFindStart(Ljava/lang/String;ZZ)V

    return-void
.end method

.method public PDFGetCurrPage()I
    .locals 1

    .line 3012
    iget v0, p0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    return v0
.end method

.method public PDFGetDoc()Lcom/radaee/pdf/Document;
    .locals 1

    .line 2841
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    return-object v0
.end method

.method public PDFGetMinScale()F
    .locals 2

    .line 3120
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_0

    iget v0, v0, Lcom/radaee/view/GLLayout;->m_scale_min:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 3121
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v0, v0, Lcom/radaee/view/GLLayout;->m_scale_min:F

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public final PDFGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;
    .locals 1

    .line 3075
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_0

    .line 3076
    invoke-virtual {v0, p1, p2}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public PDFGetScale()F
    .locals 2

    .line 3114
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_0

    iget v0, v0, Lcom/radaee/view/GLLayout;->m_scale:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 3115
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v0, v0, Lcom/radaee/view/GLLayout;->m_scale:F

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public PDFGetView()I
    .locals 1

    .line 860
    iget v0, p0, Lcom/radaee/reader/GLView;->m_view_mode:I

    return v0
.end method

.method public PDFGetZoom()F
    .locals 1

    .line 3144
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/view/GLLayout;->vGetZoom()F

    move-result v0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public PDFGotoPage(I)V
    .locals 2

    .line 2876
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-nez v0, :cond_0

    return-void

    .line 2877
    :cond_0
    iget v0, p0, Lcom/radaee/reader/GLView;->m_w:I

    if-lez v0, :cond_2

    iget v0, p0, Lcom/radaee/reader/GLView;->m_h:I

    if-gtz v0, :cond_1

    goto :goto_0

    .line 2885
    :cond_1
    new-instance v0, Lcom/radaee/reader/GLView$21;

    invoke-direct {v0, p0, p1}, Lcom/radaee/reader/GLView$21;-><init>(Lcom/radaee/reader/GLView;I)V

    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 2878
    :cond_2
    :goto_0
    new-instance v0, Lcom/radaee/view/GLLayout$PDFPos;

    invoke-direct {v0}, Lcom/radaee/view/GLLayout$PDFPos;-><init>()V

    .line 2879
    iput p1, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    const/4 v1, 0x0

    .line 2880
    iput v1, v0, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    .line 2881
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1, p1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p1

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr p1, v1

    iput p1, v0, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    .line 2882
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_goto_pos:Lcom/radaee/view/GLLayout$PDFPos;

    .line 2893
    :goto_1
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->postInvalidate()V

    return-void
.end method

.method public PDFOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/ILayoutView$PDFLayoutListener;Lcom/radaee/reader/GLCanvas;II)V
    .locals 0

    .line 699
    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    .line 700
    iput-object p2, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    .line 701
    iput-object p3, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    const/4 p1, 0x1

    add-int/2addr p4, p1

    and-int/lit8 p2, p4, -0x2

    .line 702
    iput p2, p0, Lcom/radaee/reader/GLView;->m_page_gap:I

    .line 703
    invoke-static {p5}, Lcom/radaee/pdf/Global;->getThemeGapColor(I)I

    move-result p2

    iput p2, p0, Lcom/radaee/reader/GLView;->m_back_color:I

    .line 704
    sget p2, Lcom/radaee/pdf/Global;->pdf_theme:I

    if-ne p2, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    sput-boolean p1, Lcom/radaee/pdf/Global;->dark_mode:Z

    .line 705
    sget p1, Lcom/radaee/pdf/Global;->def_view:I

    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->PDFSetView(I)V

    return-void
.end method

.method public PDFPerformAnnot()V
    .locals 0

    .line 2696
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->executeAnnotation()Z

    return-void
.end method

.method public PDFRedo()V
    .locals 4

    .line 2942
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_opstack:Lcom/radaee/reader/PDFLayoutOPStack;

    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutOPStack;->redo()Lcom/radaee/reader/OPItem;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 2944
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/OPItem;->op_redo(Lcom/radaee/pdf/Document;)V

    .line 2945
    invoke-virtual {v0, v1}, Lcom/radaee/reader/OPItem;->get_pgno(I)I

    move-result v1

    const/4 v2, 0x1

    .line 2946
    invoke-virtual {v0, v2}, Lcom/radaee/reader/OPItem;->get_pgno(I)I

    move-result v2

    .line 2947
    iget v3, v0, Lcom/radaee/reader/OPItem;->m_pageno:I

    invoke-virtual {p0, v3}, Lcom/radaee/reader/GLView;->PDFGotoPage(I)V

    if-ne v1, v2, :cond_0

    .line 2949
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v2, v0, Lcom/radaee/reader/OPItem;->m_pageno:I

    invoke-virtual {v1, v2}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 2950
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2951
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v1, :cond_1

    iget v0, v0, Lcom/radaee/reader/OPItem;->m_pageno:I

    invoke-interface {v1, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    return-void

    .line 2955
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 2956
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0, v2}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 2957
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2958
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v0, :cond_1

    .line 2960
    invoke-interface {v0, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 2961
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    invoke-interface {v0, v2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_1
    return-void

    .line 2965
    :cond_2
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "No more redo."

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public PDFRemoveAnnot()V
    .locals 3

    .line 2622
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v1, 0x64

    if-eq v0, v1, :cond_0

    return-void

    .line 2625
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFCanSave()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->IsReadOnly()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->IsLocked()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 2636
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object v0

    .line 2637
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->RemoveFromPage()Z

    const/4 v1, 0x0

    .line 2638
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 2639
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v1, v2, v0}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;[F)V

    .line 2640
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2641
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v0, :cond_2

    .line 2642
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v1}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 2643
    :cond_2
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFEndAnnot()V

    return-void

    .line 2626
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->cannot_write_or_encrypted:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 2627
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFEndAnnot()V

    return-void
.end method

.method public PDFRestoreView()V
    .locals 1

    .line 759
    new-instance v0, Lcom/radaee/reader/PDFLayoutOPStack;

    invoke-direct {v0}, Lcom/radaee/reader/PDFLayoutOPStack;-><init>()V

    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_opstack:Lcom/radaee/reader/PDFLayoutOPStack;

    .line 760
    new-instance v0, Lcom/radaee/reader/GLView$7;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$7;-><init>(Lcom/radaee/reader/GLView;)V

    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public PDFSave()Z
    .locals 1

    .line 2977
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->Save()Z

    move-result v0

    return v0
.end method

.method public PDFSaveView()V
    .locals 3

    .line 733
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/radaee/reader/GLView;->m_w:I

    shr-int/lit8 v1, v1, 0x1

    iget v2, p0, Lcom/radaee/reader/GLView;->m_h:I

    shr-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_save_pos:Lcom/radaee/view/GLLayout$PDFPos;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 734
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_save_pos:Lcom/radaee/view/GLLayout$PDFPos;

    :goto_0
    const/4 v0, 0x2

    .line 735
    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->PDFSetEditbox(I)V

    .line 736
    new-instance v0, Lcom/radaee/reader/GLView$6;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$6;-><init>(Lcom/radaee/reader/GLView;)V

    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    .line 749
    monitor-enter p0

    .line 751
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    .line 754
    :catch_0
    :goto_1
    :try_start_1
    monitor-exit p0

    return-void

    :goto_2
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public PDFScrolltoPage(I)V
    .locals 2

    .line 2897
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-nez v0, :cond_0

    return-void

    .line 2898
    :cond_0
    iget v1, p0, Lcom/radaee/reader/GLView;->m_w:I

    if-lez v1, :cond_2

    iget v1, p0, Lcom/radaee/reader/GLView;->m_h:I

    if-gtz v1, :cond_1

    goto :goto_0

    .line 2905
    :cond_1
    invoke-virtual {v0, p1}, Lcom/radaee/view/GLLayout;->vScrolltoPage(I)V

    .line 2906
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    goto :goto_1

    .line 2899
    :cond_2
    :goto_0
    new-instance v0, Lcom/radaee/view/GLLayout$PDFPos;

    invoke-direct {v0}, Lcom/radaee/view/GLLayout$PDFPos;-><init>()V

    .line 2900
    iput p1, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    const/4 v1, 0x0

    .line 2901
    iput v1, v0, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    .line 2902
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1, p1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p1

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr p1, v1

    iput p1, v0, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    .line 2903
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_goto_pos:Lcom/radaee/view/GLLayout$PDFPos;

    .line 2908
    :goto_1
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->postInvalidate()V

    return-void
.end method

.method public PDFSetArrow(I)V
    .locals 1

    const/4 v0, 0x1

    .line 2394
    invoke-virtual {p0, p1, v0}, Lcom/radaee/reader/GLView;->PDFSetLineOrArrow(IZ)V

    return-void
.end method

.method public PDFSetBGColor(I)V
    .locals 0

    .line 2981
    invoke-static {p1}, Lcom/radaee/pdf/Global;->getThemeGapColor(I)I

    move-result p1

    iput p1, p0, Lcom/radaee/reader/GLView;->m_back_color:I

    .line 2982
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_gl10:Ljavax/microedition/khronos/opengles/GL10;

    if-eqz p1, :cond_0

    .line 2983
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2984
    :cond_0
    new-instance p1, Lcom/radaee/reader/GLView$22;

    invoke-direct {p1, p0}, Lcom/radaee/reader/GLView$22;-><init>(Lcom/radaee/reader/GLView;)V

    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public PDFSetEditbox(I)V
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    if-nez v1, :cond_0

    const/16 v1, 0x9

    .line 2545
    iput v1, v0, Lcom/radaee/reader/GLView;->m_status:I

    return-void

    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v4, :cond_a

    .line 2548
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v1, :cond_9

    .line 2549
    array-length v1, v1

    .line 2551
    new-instance v5, Lcom/radaee/reader/GLView$PDFGLPageSet;

    invoke-direct {v5, v1}, Lcom/radaee/reader/GLView$PDFGLPageSet;-><init>(I)V

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v1, :cond_7

    .line 2553
    iget-object v7, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v9, v8, v6

    float-to-int v9, v9

    add-int/lit8 v10, v6, 0x1

    aget v8, v8, v10

    float-to-int v8, v8

    invoke-virtual {v7, v9, v8}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v7

    .line 2554
    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v7, v7, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v8, v7}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v7

    .line 2555
    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v11

    if-eqz v11, :cond_6

    .line 2557
    invoke-virtual {v11}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2558
    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v8}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v8

    int-to-float v8, v8

    iget-object v9, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v9}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v7, v8, v9}, Lcom/radaee/view/GLPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v8

    const/4 v9, 0x4

    .line 2559
    new-array v12, v9, [F

    .line 2560
    iget-object v9, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v13, v9, v6

    add-int/lit8 v14, v6, 0x2

    aget v15, v9, v14

    const/16 v16, 0x2

    cmpl-float v17, v13, v15

    if-lez v17, :cond_1

    .line 2561
    aput v15, v12, v3

    .line 2562
    aget v13, v9, v6

    aput v13, v12, v16

    goto :goto_1

    .line 2564
    :cond_1
    aput v13, v12, v3

    .line 2565
    aget v13, v9, v14

    aput v13, v12, v16

    .line 2567
    :goto_1
    aget v13, v9, v10

    add-int/lit8 v14, v6, 0x3

    aget v15, v9, v14

    const/16 v17, 0x3

    cmpl-float v18, v13, v15

    if-lez v18, :cond_2

    .line 2568
    aput v15, v12, v4

    .line 2569
    aget v9, v9, v10

    aput v9, v12, v17

    goto :goto_2

    .line 2571
    :cond_2
    aput v13, v12, v4

    .line 2572
    aget v9, v9, v14

    aput v9, v12, v17

    .line 2574
    :goto_2
    invoke-virtual {v8, v12}, Lcom/radaee/pdf/Matrix;->TransformRect([F)V

    .line 2575
    aget v9, v12, v16

    aget v10, v12, v3

    sub-float/2addr v9, v10

    const/high16 v13, 0x42a00000    # 80.0f

    cmpg-float v9, v9, v13

    if-gez v9, :cond_3

    add-float/2addr v10, v13

    aput v10, v12, v16

    .line 2576
    :cond_3
    aget v9, v12, v17

    aget v10, v12, v4

    sub-float v10, v9, v10

    const/high16 v13, 0x41800000    # 16.0f

    cmpg-float v10, v10, v13

    if-gez v10, :cond_4

    sub-float/2addr v9, v13

    aput v9, v12, v4

    :cond_4
    const/high16 v9, 0x40400000    # 3.0f

    .line 2577
    invoke-virtual {v7, v9}, Lcom/radaee/view/GLPage;->ToPDFSize(F)F

    move-result v14

    const/high16 v16, 0x41400000    # 12.0f

    const/high16 v17, -0x10000

    const/high16 v13, -0x10000

    const/4 v15, 0x0

    invoke-virtual/range {v11 .. v17}, Lcom/radaee/pdf/Page;->AddAnnotEditbox([FIFIFI)Z

    move-result v9

    .line 2578
    invoke-virtual {v8}, Lcom/radaee/pdf/Matrix;->Destroy()V

    if-nez v9, :cond_5

    .line 2581
    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "Not available."

    invoke-static {v8, v9, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 2584
    :cond_5
    invoke-virtual {v5, v7}, Lcom/radaee/reader/GLView$PDFGLPageSet;->Insert(Lcom/radaee/view/GLPage;)V

    .line 2585
    invoke-virtual {v11}, Lcom/radaee/pdf/Page;->Close()V

    :cond_6
    add-int/lit8 v6, v6, 0x4

    goto/16 :goto_0

    :cond_7
    const/4 v1, 0x0

    .line 2588
    :goto_3
    iget v4, v5, Lcom/radaee/reader/GLView$PDFGLPageSet;->pages_cnt:I

    if-ge v1, v4, :cond_9

    .line 2589
    iget-object v4, v5, Lcom/radaee/reader/GLView$PDFGLPageSet;->pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v1

    .line 2590
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6, v4}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 2591
    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2592
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v6, :cond_8

    .line 2593
    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v4

    invoke-interface {v6, v4}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 2596
    :cond_9
    iput v3, v0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2597
    iput-object v2, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 2598
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v1, :cond_b

    invoke-virtual {v1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    return-void

    .line 2601
    :cond_a
    iput v3, v0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2602
    iput-object v2, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 2603
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v1, :cond_b

    invoke-virtual {v1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_b
    return-void
.end method

.method public PDFSetEllipse(I)V
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p1

    if-nez v1, :cond_0

    const/4 v1, 0x5

    .line 2256
    iput v1, v0, Lcom/radaee/reader/GLView;->m_status:I

    return-void

    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v4, :cond_7

    .line 2259
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v1, :cond_6

    .line 2260
    array-length v1, v1

    .line 2262
    new-instance v5, Lcom/radaee/reader/GLView$PDFGLPageSet;

    invoke-direct {v5, v1}, Lcom/radaee/reader/GLView$PDFGLPageSet;-><init>(I)V

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v1, :cond_4

    .line 2264
    iget-object v7, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v9, v8, v6

    float-to-int v9, v9

    add-int/lit8 v10, v6, 0x1

    aget v8, v8, v10

    float-to-int v8, v8

    invoke-virtual {v7, v9, v8}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v7

    .line 2265
    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v7, v7, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v8, v7}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v7

    .line 2266
    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v8

    if-eqz v8, :cond_3

    .line 2268
    invoke-virtual {v8}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2269
    iget-object v9, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v9}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v9

    int-to-float v9, v9

    iget-object v11, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v11}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v11

    int-to-float v11, v11

    invoke-virtual {v7, v9, v11}, Lcom/radaee/view/GLPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v9

    const/4 v11, 0x4

    .line 2270
    new-array v11, v11, [F

    .line 2271
    iget-object v12, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v13, v12, v6

    add-int/lit8 v14, v6, 0x2

    aget v15, v12, v14

    const/16 v16, 0x2

    cmpl-float v17, v13, v15

    if-lez v17, :cond_1

    .line 2272
    aput v15, v11, v3

    .line 2273
    aget v13, v12, v6

    aput v13, v11, v16

    goto :goto_1

    .line 2275
    :cond_1
    aput v13, v11, v3

    .line 2276
    aget v13, v12, v14

    aput v13, v11, v16

    .line 2278
    :goto_1
    aget v13, v12, v10

    add-int/lit8 v14, v6, 0x3

    aget v15, v12, v14

    const/16 v16, 0x3

    cmpl-float v17, v13, v15

    if-lez v17, :cond_2

    .line 2279
    aput v15, v11, v4

    .line 2280
    aget v10, v12, v10

    aput v10, v11, v16

    goto :goto_2

    .line 2282
    :cond_2
    aput v13, v11, v4

    .line 2283
    aget v10, v12, v14

    aput v10, v11, v16

    .line 2285
    :goto_2
    invoke-virtual {v9, v11}, Lcom/radaee/pdf/Matrix;->TransformRect([F)V

    .line 2286
    sget v10, Lcom/radaee/pdf/Global;->inkWidth:F

    invoke-virtual {v7, v10}, Lcom/radaee/view/GLPage;->ToPDFSize(F)F

    move-result v10

    sget v12, Lcom/radaee/pdf/Global;->inkColor:I

    sget v13, Lcom/radaee/pdf/Global;->fillColor:I

    invoke-virtual {v8, v11, v10, v12, v13}, Lcom/radaee/pdf/Page;->AddAnnotEllipse([FFII)Z

    .line 2287
    invoke-virtual {v9}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 2288
    invoke-virtual {v8}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v9

    sub-int/2addr v9, v4

    invoke-virtual {v8, v9}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v9

    invoke-direct {v0, v9}, Lcom/radaee/reader/GLView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 2291
    invoke-virtual {v8}, Lcom/radaee/pdf/Page;->Close()V

    .line 2292
    invoke-virtual {v5, v7}, Lcom/radaee/reader/GLView$PDFGLPageSet;->Insert(Lcom/radaee/view/GLPage;)V

    :cond_3
    add-int/lit8 v6, v6, 0x4

    goto/16 :goto_0

    :cond_4
    const/4 v1, 0x0

    .line 2295
    :goto_3
    iget v4, v5, Lcom/radaee/reader/GLView$PDFGLPageSet;->pages_cnt:I

    if-ge v1, v4, :cond_6

    .line 2296
    iget-object v4, v5, Lcom/radaee/reader/GLView$PDFGLPageSet;->pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v1

    .line 2297
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6, v4}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 2298
    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2299
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v6, :cond_5

    .line 2300
    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v4

    invoke-interface {v6, v4}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 2303
    :cond_6
    iput v3, v0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2304
    iput-object v2, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 2305
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    return-void

    .line 2308
    :cond_7
    iput v3, v0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2309
    iput-object v2, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 2310
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_8
    return-void
.end method

.method public PDFSetInk(I)V
    .locals 5

    if-nez p1, :cond_0

    const/4 p1, 0x3

    .line 2070
    iput p1, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2071
    new-instance p1, Lcom/radaee/pdf/Ink;

    sget v0, Lcom/radaee/pdf/Global;->inkWidth:F

    sget v1, Lcom/radaee/pdf/Global;->inkColor:I

    invoke-direct {p1, v0, v1}, Lcom/radaee/pdf/Ink;-><init>(FI)V

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v1, :cond_4

    .line 2074
    iput v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2075
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    if-eqz p1, :cond_2

    .line 2076
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 2078
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2079
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v3}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v4}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v0, v3, v4}, Lcom/radaee/view/GLPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v0

    .line 2080
    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    invoke-virtual {v0, v3}, Lcom/radaee/pdf/Matrix;->TransformInk(Lcom/radaee/pdf/Ink;)V

    .line 2081
    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    invoke-virtual {p1, v3}, Lcom/radaee/pdf/Page;->AddAnnotInk(Lcom/radaee/pdf/Ink;)Z

    .line 2082
    invoke-virtual {v0}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 2083
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v0

    sub-int/2addr v0, v1

    .line 2084
    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    .line 2085
    invoke-direct {p0, v0}, Lcom/radaee/reader/GLView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    if-eqz v0, :cond_1

    .line 2089
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object v0

    invoke-virtual {v1, v3, v0}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;[F)V

    .line 2090
    :cond_1
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2091
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    .line 2092
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_2

    .line 2093
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 2096
    :cond_2
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/radaee/pdf/Ink;->Destroy()V

    .line 2097
    :cond_3
    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    .line 2098
    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 2099
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    return-void

    .line 2102
    :cond_4
    iput v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2103
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    invoke-virtual {p1}, Lcom/radaee/pdf/Ink;->Destroy()V

    .line 2104
    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    .line 2105
    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 2106
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_5
    return-void
.end method

.method public PDFSetLine(I)V
    .locals 1

    const/4 v0, 0x0

    .line 2391
    invoke-virtual {p0, p1, v0}, Lcom/radaee/reader/GLView;->PDFSetLineOrArrow(IZ)V

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

    .line 2399
    :goto_0
    iput v1, v0, Lcom/radaee/reader/GLView;->m_status:I

    return-void

    :cond_1
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v4, :cond_6

    .line 2402
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v1, :cond_5

    .line 2403
    array-length v1, v1

    .line 2407
    new-instance v5, Lcom/radaee/reader/GLView$PDFGLPageSet;

    invoke-direct {v5, v1}, Lcom/radaee/reader/GLView$PDFGLPageSet;-><init>(I)V

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v1, :cond_3

    .line 2409
    iget-object v7, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v9, v8, v6

    float-to-int v9, v9

    add-int/lit8 v10, v6, 0x1

    aget v8, v8, v10

    float-to-int v8, v8

    invoke-virtual {v7, v9, v8}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v7

    .line 2410
    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v7, v7, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v8, v7}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v7

    .line 2411
    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v9, v8, v6

    .line 2412
    aget v10, v8, v10

    const/4 v11, 0x2

    new-array v13, v11, [F

    aput v9, v13, v3

    aput v10, v13, v4

    add-int/lit8 v9, v6, 0x2

    .line 2413
    aget v9, v8, v9

    add-int/lit8 v10, v6, 0x3

    .line 2414
    aget v8, v8, v10

    new-array v14, v11, [F

    aput v9, v14, v3

    aput v8, v14, v4

    .line 2415
    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v12

    if-eqz v12, :cond_2

    .line 2417
    invoke-virtual {v12}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2418
    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v8}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v8

    int-to-float v8, v8

    iget-object v9, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v9}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v7, v8, v9}, Lcom/radaee/view/GLPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v8

    .line 2419
    invoke-virtual {v8, v13}, Lcom/radaee/pdf/Matrix;->TransformPoint([F)V

    .line 2420
    invoke-virtual {v8, v14}, Lcom/radaee/pdf/Matrix;->TransformPoint([F)V

    .line 2424
    sget v9, Lcom/radaee/pdf/Global;->inkWidth:F

    .line 2425
    invoke-virtual {v7, v9}, Lcom/radaee/view/GLPage;->ToPDFSize(F)F

    move-result v17

    sget v18, Lcom/radaee/pdf/Global;->inkColor:I

    sget v19, Lcom/radaee/pdf/Global;->fillColor:I

    const/4 v15, 0x0

    move/from16 v16, p2

    .line 2422
    invoke-virtual/range {v12 .. v19}, Lcom/radaee/pdf/Page;->AddAnnotLine([F[FIIFII)Z

    .line 2428
    invoke-virtual {v8}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 2429
    invoke-virtual {v12}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v8

    sub-int/2addr v8, v4

    invoke-virtual {v12, v8}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v8

    invoke-direct {v0, v8}, Lcom/radaee/reader/GLView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 2432
    invoke-virtual {v12}, Lcom/radaee/pdf/Page;->Close()V

    .line 2433
    invoke-virtual {v5, v7}, Lcom/radaee/reader/GLView$PDFGLPageSet;->Insert(Lcom/radaee/view/GLPage;)V

    :cond_2
    add-int/lit8 v6, v6, 0x4

    goto/16 :goto_1

    :cond_3
    const/4 v1, 0x0

    .line 2436
    :goto_2
    iget v4, v5, Lcom/radaee/reader/GLView$PDFGLPageSet;->pages_cnt:I

    if-ge v1, v4, :cond_5

    .line 2437
    iget-object v4, v5, Lcom/radaee/reader/GLView$PDFGLPageSet;->pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v1

    .line 2438
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6, v4}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 2439
    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2440
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v6, :cond_4

    .line 2441
    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v4

    invoke-interface {v6, v4}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 2444
    :cond_5
    iput v3, v0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2445
    iput-object v2, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 2446
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v1, :cond_7

    invoke-virtual {v1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    return-void

    .line 2449
    :cond_6
    iput v3, v0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2450
    iput-object v2, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 2451
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v1, :cond_7

    invoke-virtual {v1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_7
    return-void
.end method

.method public PDFSetNote(I)V
    .locals 7

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 2333
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_note_pages:[Lcom/radaee/view/GLPage;

    .line 2334
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_note_indecs:[I

    const/4 p1, 0x6

    .line 2335
    iput p1, p0, Lcom/radaee/reader/GLView;->m_status:I

    return-void

    :cond_0
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v1, :cond_2

    .line 2338
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_note_pages:[Lcom/radaee/view/GLPage;

    if-eqz p1, :cond_1

    .line 2340
    array-length p1, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_1

    .line 2342
    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    iget-object v4, p0, Lcom/radaee/reader/GLView;->m_note_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v4

    invoke-interface {v3, v4}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2346
    :cond_1
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_note_pages:[Lcom/radaee/view/GLPage;

    .line 2347
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_note_indecs:[I

    .line 2348
    iput v2, p0, Lcom/radaee/reader/GLView;->m_status:I

    return-void

    .line 2351
    :cond_2
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_note_pages:[Lcom/radaee/view/GLPage;

    if-eqz p1, :cond_5

    .line 2354
    array-length p1, p1

    const/4 v1, 0x0

    :goto_1
    if-ge v1, p1, :cond_4

    .line 2356
    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_note_pages:[Lcom/radaee/view/GLPage;

    aget-object v3, v3, v1

    .line 2357
    iget-object v4, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v3}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v4

    .line 2358
    invoke-virtual {v4}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2359
    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_note_indecs:[I

    aget v5, v5, v1

    .line 2361
    :goto_2
    invoke-virtual {v4, v5}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 2362
    invoke-virtual {v6}, Lcom/radaee/pdf/Page$Annotation;->RemoveFromPage()Z

    goto :goto_2

    .line 2365
    :cond_3
    invoke-virtual {v4}, Lcom/radaee/pdf/Page;->Close()V

    .line 2366
    iget-object v4, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v4, v3}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 2367
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2370
    :cond_4
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_note_pages:[Lcom/radaee/view/GLPage;

    .line 2371
    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_note_indecs:[I

    .line 2372
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    .line 2374
    :cond_5
    iput v2, p0, Lcom/radaee/reader/GLView;->m_status:I

    return-void
.end method

.method public PDFSetPolygon(I)V
    .locals 8

    if-nez p1, :cond_0

    const/16 p1, 0xa

    .line 2112
    iput p1, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2113
    new-instance p1, Lcom/radaee/pdf/Path;

    invoke-direct {p1}, Lcom/radaee/pdf/Path;-><init>()V

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v1, :cond_3

    .line 2116
    iput v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2117
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    if-eqz p1, :cond_1

    .line 2118
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 2119
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {v0}, Lcom/radaee/pdf/Path;->GetNodeCount()I

    move-result v0

    const/4 v3, 0x2

    if-le v0, v3, :cond_1

    .line 2120
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2121
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v3}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v4}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v0, v3, v4}, Lcom/radaee/view/GLPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v0

    .line 2122
    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {v0, v3}, Lcom/radaee/pdf/Matrix;->TransformPath(Lcom/radaee/pdf/Path;)V

    .line 2123
    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    sget v4, Lcom/radaee/pdf/Global;->inkColor:I

    sget v5, Lcom/radaee/pdf/Global;->fillColor:I

    iget-object v6, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    sget v7, Lcom/radaee/pdf/Global;->g_line_annot_width:F

    invoke-virtual {v6, v7}, Lcom/radaee/view/GLPage;->ToPDFSize(F)F

    move-result v6

    invoke-virtual {p1, v3, v4, v5, v6}, Lcom/radaee/pdf/Page;->AddAnnotPolygon(Lcom/radaee/pdf/Path;IIF)Z

    .line 2124
    invoke-virtual {v0}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 2125
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v0

    sub-int/2addr v0, v1

    .line 2126
    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    .line 2127
    invoke-direct {p0, v0}, Lcom/radaee/reader/GLView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 2130
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object v0

    invoke-virtual {v1, v3, v0}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;[F)V

    .line 2131
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2132
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    .line 2133
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_1

    .line 2134
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 2137
    :cond_1
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/radaee/pdf/Path;->Destroy()V

    .line 2138
    :cond_2
    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    .line 2139
    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 2140
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    return-void

    .line 2143
    :cond_3
    iput v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2144
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {p1}, Lcom/radaee/pdf/Path;->Destroy()V

    .line 2145
    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    .line 2146
    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 2147
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_4
    return-void
.end method

.method public PDFSetPolyline(I)V
    .locals 10

    if-nez p1, :cond_0

    const/16 p1, 0xb

    .line 2153
    iput p1, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2154
    new-instance p1, Lcom/radaee/pdf/Path;

    invoke-direct {p1}, Lcom/radaee/pdf/Path;-><init>()V

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v1, :cond_3

    .line 2157
    iput v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2158
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    if-eqz p1, :cond_1

    .line 2159
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 2160
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {p1}, Lcom/radaee/pdf/Path;->GetNodeCount()I

    move-result p1

    if-le p1, v1, :cond_1

    .line 2161
    invoke-virtual {v3}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2162
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v0

    int-to-float v0, v0

    iget-object v4, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v4}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p1, v0, v4}, Lcom/radaee/view/GLPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object p1

    .line 2163
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Matrix;->TransformPath(Lcom/radaee/pdf/Path;)V

    .line 2164
    iget-object v4, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    sget v7, Lcom/radaee/pdf/Global;->inkColor:I

    sget v8, Lcom/radaee/pdf/Global;->fillColor:I

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    sget v5, Lcom/radaee/pdf/Global;->g_line_annot_width:F

    invoke-virtual {v0, v5}, Lcom/radaee/view/GLPage;->ToPDFSize(F)F

    move-result v9

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v3 .. v9}, Lcom/radaee/pdf/Page;->AddAnnotPolyline(Lcom/radaee/pdf/Path;IIIIF)Z

    .line 2165
    invoke-virtual {p1}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 2166
    invoke-virtual {v3}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result p1

    sub-int/2addr p1, v1

    .line 2167
    invoke-virtual {v3, p1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object p1

    .line 2168
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 2171
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;[F)V

    .line 2172
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2173
    invoke-virtual {v3}, Lcom/radaee/pdf/Page;->Close()V

    .line 2174
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_1

    .line 2175
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 2178
    :cond_1
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/radaee/pdf/Path;->Destroy()V

    .line 2179
    :cond_2
    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    .line 2180
    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 2181
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    return-void

    .line 2184
    :cond_3
    iput v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2185
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    invoke-virtual {p1}, Lcom/radaee/pdf/Path;->Destroy()V

    .line 2186
    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_polygon:Lcom/radaee/pdf/Path;

    .line 2187
    iput-object v2, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 2188
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_4
    return-void
.end method

.method public PDFSetPos(Lcom/radaee/view/GLLayout$PDFPos;II)V
    .locals 1

    .line 3081
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_0

    .line 3082
    new-instance v0, Lcom/radaee/reader/GLView$24;

    invoke-direct {v0, p0, p2, p3, p1}, Lcom/radaee/reader/GLView$24;-><init>(Lcom/radaee/reader/GLView;IILcom/radaee/view/GLLayout$PDFPos;)V

    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public PDFSetRect(I)V
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    const/4 v2, 0x4

    if-nez v1, :cond_0

    .line 2195
    iput v2, v0, Lcom/radaee/reader/GLView;->m_status:I

    return-void

    :cond_0
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v1, v5, :cond_7

    .line 2198
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v1, :cond_6

    .line 2199
    array-length v1, v1

    .line 2201
    new-instance v6, Lcom/radaee/reader/GLView$PDFGLPageSet;

    invoke-direct {v6, v1}, Lcom/radaee/reader/GLView$PDFGLPageSet;-><init>(I)V

    const/4 v7, 0x0

    :goto_0
    if-ge v7, v1, :cond_4

    .line 2203
    iget-object v8, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v9, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v10, v9, v7

    float-to-int v10, v10

    add-int/lit8 v11, v7, 0x1

    aget v9, v9, v11

    float-to-int v9, v9

    invoke-virtual {v8, v10, v9}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v8

    .line 2204
    iget-object v9, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v8, v8, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v9, v8}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v8

    .line 2205
    iget-object v9, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v9

    if-eqz v9, :cond_3

    .line 2207
    invoke-virtual {v9}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2208
    iget-object v10, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v10}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v10

    int-to-float v10, v10

    iget-object v12, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v12}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v12

    int-to-float v12, v12

    invoke-virtual {v8, v10, v12}, Lcom/radaee/view/GLPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v10

    .line 2209
    new-array v12, v2, [F

    .line 2210
    iget-object v13, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v14, v13, v7

    add-int/lit8 v15, v7, 0x2

    aget v16, v13, v15

    const/16 v17, 0x2

    cmpl-float v18, v14, v16

    if-lez v18, :cond_1

    .line 2211
    aput v16, v12, v4

    .line 2212
    aget v14, v13, v7

    aput v14, v12, v17

    goto :goto_1

    .line 2214
    :cond_1
    aput v14, v12, v4

    .line 2215
    aget v14, v13, v15

    aput v14, v12, v17

    .line 2217
    :goto_1
    aget v14, v13, v11

    add-int/lit8 v15, v7, 0x3

    aget v16, v13, v15

    const/16 v17, 0x3

    cmpl-float v18, v14, v16

    if-lez v18, :cond_2

    .line 2218
    aput v16, v12, v5

    .line 2219
    aget v11, v13, v11

    aput v11, v12, v17

    goto :goto_2

    .line 2221
    :cond_2
    aput v14, v12, v5

    .line 2222
    aget v11, v13, v15

    aput v11, v12, v17

    .line 2224
    :goto_2
    invoke-virtual {v10, v12}, Lcom/radaee/pdf/Matrix;->TransformRect([F)V

    .line 2225
    sget v11, Lcom/radaee/pdf/Global;->inkWidth:F

    invoke-virtual {v8, v11}, Lcom/radaee/view/GLPage;->ToPDFSize(F)F

    move-result v11

    sget v13, Lcom/radaee/pdf/Global;->inkColor:I

    sget v14, Lcom/radaee/pdf/Global;->fillColor:I

    invoke-virtual {v9, v12, v11, v13, v14}, Lcom/radaee/pdf/Page;->AddAnnotRect([FFII)Z

    .line 2226
    invoke-virtual {v10}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 2227
    invoke-virtual {v9}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v10

    sub-int/2addr v10, v5

    invoke-virtual {v9, v10}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v10

    invoke-direct {v0, v10}, Lcom/radaee/reader/GLView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 2230
    invoke-virtual {v6, v8}, Lcom/radaee/reader/GLView$PDFGLPageSet;->Insert(Lcom/radaee/view/GLPage;)V

    .line 2231
    invoke-virtual {v9}, Lcom/radaee/pdf/Page;->Close()V

    :cond_3
    add-int/lit8 v7, v7, 0x4

    goto/16 :goto_0

    :cond_4
    const/4 v1, 0x0

    .line 2234
    :goto_3
    iget v2, v6, Lcom/radaee/reader/GLView$PDFGLPageSet;->pages_cnt:I

    if-ge v1, v2, :cond_6

    .line 2235
    iget-object v2, v6, Lcom/radaee/reader/GLView$PDFGLPageSet;->pages:[Lcom/radaee/view/GLPage;

    aget-object v2, v2, v1

    .line 2236
    iget-object v5, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v5, v2}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 2237
    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2238
    iget-object v5, v0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v5, :cond_5

    .line 2239
    invoke-virtual {v2}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v2

    invoke-interface {v5, v2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 2242
    :cond_6
    iput v4, v0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2243
    iput-object v3, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 2244
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    return-void

    .line 2247
    :cond_7
    iput v4, v0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2248
    iput-object v3, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 2249
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_8
    return-void
.end method

.method public PDFSetScale(F)V
    .locals 7

    const/4 v0, 0x0

    .line 3093
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->is_waitting:Z

    .line 3094
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->is_notified:Z

    .line 3095
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getWidth()I

    move-result v0

    shr-int/lit8 v4, v0, 0x1

    .line 3096
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getHeight()I

    move-result v0

    shr-int/lit8 v5, v0, 0x1

    .line 3098
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0, v4, v5}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v6

    .line 3099
    new-instance v1, Lcom/radaee/reader/GLView$25;

    move-object v2, p0

    move v3, p1

    invoke-direct/range {v1 .. v6}, Lcom/radaee/reader/GLView$25;-><init>(Lcom/radaee/reader/GLView;FIILcom/radaee/view/GLLayout$PDFPos;)V

    invoke-virtual {p0, v1}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    .line 3110
    invoke-direct {p0}, Lcom/radaee/reader/GLView;->wait_init()V

    return-void
.end method

.method public PDFSetSelMarkup(ILjava/lang/String;)Z
    .locals 4

    .line 2815
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    if-eqz v0, :cond_4

    invoke-virtual {v0, p1}, Lcom/radaee/view/VSel;->SetSelMarkup(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2817
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    invoke-virtual {v0}, Lcom/radaee/view/VSel;->GetPage()Lcom/radaee/pdf/Page;

    move-result-object v0

    .line 2818
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v1

    const/4 v3, 0x1

    sub-int/2addr v1, v3

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    if-nez p1, :cond_0

    if-eqz v0, :cond_0

    .line 2821
    sget p1, Lcom/radaee/pdf/Global;->highlight_color:I

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Page$Annotation;->SetFillColor(I)Z

    :cond_0
    if-eqz p2, :cond_1

    if-eqz v0, :cond_1

    .line 2824
    invoke-virtual {v0, p2}, Lcom/radaee/pdf/Page$Annotation;->SetEditText(Ljava/lang/String;)Z

    .line 2825
    :cond_1
    invoke-direct {p0, v0}, Lcom/radaee/reader/GLView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 2827
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object p2, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;[F)V

    const/4 p1, 0x0

    .line 2828
    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    .line 2829
    iput v2, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2830
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2831
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    .line 2832
    :cond_2
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_3

    .line 2833
    iget-object p2, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {p2}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result p2

    invoke-interface {p1, p2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_3
    return v3

    :cond_4
    return v2
.end method

.method public PDFSetSelect()V
    .locals 4

    .line 2315
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    .line 2316
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_sel_icon1:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 2317
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_sel_icon2:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 2318
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_sel_icon1:Landroid/graphics/Bitmap;

    .line 2319
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_sel_icon2:Landroid/graphics/Bitmap;

    .line 2320
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    const/4 v0, 0x0

    .line 2321
    iput v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    goto :goto_0

    .line 2323
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Lcom/radaee/viewlib/R$drawable;->pt_start:I

    invoke-static {v0, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_sel_icon1:Landroid/graphics/Bitmap;

    .line 2324
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Lcom/radaee/viewlib/R$drawable;->pt_end:I

    invoke-static {v0, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/reader/GLView;->m_sel_icon2:Landroid/graphics/Bitmap;

    .line 2325
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 2326
    iput v2, p0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2328
    :goto_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_1
    return-void
.end method

.method public PDFSetStamp(I)V
    .locals 1

    const/4 v0, 0x0

    .line 2456
    invoke-virtual {p0, p1, v0, v0}, Lcom/radaee/reader/GLView;->PDFSetStamp(ILandroid/view/MotionEvent;Landroid/graphics/Bitmap;)Z

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

    .line 2462
    iput v1, v0, Lcom/radaee/reader/GLView;->m_status:I

    goto/16 :goto_4

    :cond_0
    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v1, v5, :cond_9

    const/4 v1, 0x4

    .line 2471
    new-array v6, v1, [F

    iput-object v6, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 2472
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    aput v7, v6, v3

    .line 2473
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    aput v7, v6, v5

    .line 2474
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    const/high16 v8, 0x42c80000    # 100.0f

    invoke-direct {v0, v8}, Lcom/radaee/reader/GLView;->d(F)I

    move-result v9

    int-to-float v9, v9

    add-float/2addr v7, v9

    const/4 v9, 0x2

    aput v7, v6, v9

    .line 2475
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-direct {v0, v8}, Lcom/radaee/reader/GLView;->d(F)I

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

    .line 2476
    iput-object v2, v0, Lcom/radaee/reader/GLView;->m_icon:Landroid/graphics/Bitmap;

    .line 2477
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v6, v2, v5}, Lcom/radaee/pdf/Document;->NewImage(Landroid/graphics/Bitmap;Z)Lcom/radaee/pdf/Document$DocImage;

    move-result-object v2

    .line 2479
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    if-eqz v6, :cond_6

    if-eqz v2, :cond_6

    .line 2480
    array-length v6, v6

    .line 2482
    new-instance v7, Lcom/radaee/reader/GLView$PDFGLPageSet;

    invoke-direct {v7, v6}, Lcom/radaee/reader/GLView$PDFGLPageSet;-><init>(I)V

    const/4 v10, 0x0

    :goto_0
    if-ge v10, v6, :cond_4

    .line 2484
    iget-object v11, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v12, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v13, v12, v10

    float-to-int v13, v13

    add-int/lit8 v14, v10, 0x1

    aget v12, v12, v14

    float-to-int v12, v12

    invoke-virtual {v11, v13, v12}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v11

    .line 2485
    iget-object v12, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v11, v11, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v12, v11}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v11

    .line 2486
    iget-object v12, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v11}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v13

    invoke-virtual {v12, v13}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v12

    if-eqz v12, :cond_3

    .line 2488
    iget-object v13, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v13}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v13

    int-to-float v13, v13

    iget-object v15, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v15}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v15

    int-to-float v15, v15

    invoke-virtual {v11, v13, v15}, Lcom/radaee/view/GLPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v13

    .line 2489
    new-array v15, v1, [F

    .line 2490
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    aget v16, v1, v10

    add-int/lit8 v17, v10, 0x2

    aget v18, v1, v17

    cmpl-float v19, v16, v18

    if-lez v19, :cond_1

    .line 2491
    aput v18, v15, v3

    .line 2492
    aget v16, v1, v10

    aput v16, v15, v9

    goto :goto_1

    .line 2494
    :cond_1
    aput v16, v15, v3

    .line 2495
    aget v16, v1, v17

    aput v16, v15, v9

    .line 2497
    :goto_1
    aget v16, v1, v14

    add-int/lit8 v17, v10, 0x3

    aget v18, v1, v17

    cmpl-float v19, v16, v18

    if-lez v19, :cond_2

    .line 2498
    aput v18, v15, v5

    .line 2499
    aget v1, v1, v14

    aput v1, v15, v8

    goto :goto_2

    .line 2501
    :cond_2
    aput v16, v15, v5

    .line 2502
    aget v1, v1, v17

    aput v1, v15, v8

    .line 2504
    :goto_2
    invoke-virtual {v13, v15}, Lcom/radaee/pdf/Matrix;->TransformRect([F)V

    .line 2505
    invoke-virtual {v12}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2506
    invoke-virtual {v12, v2, v15}, Lcom/radaee/pdf/Page;->AddAnnotBitmap(Lcom/radaee/pdf/Document$DocImage;[F)Z

    .line 2507
    invoke-virtual {v13}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 2508
    invoke-virtual {v12}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v1

    sub-int/2addr v1, v5

    invoke-virtual {v12, v1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/radaee/reader/GLView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 2511
    invoke-virtual {v12}, Lcom/radaee/pdf/Page;->Close()V

    .line 2512
    invoke-virtual {v7, v11}, Lcom/radaee/reader/GLView$PDFGLPageSet;->Insert(Lcom/radaee/view/GLPage;)V

    :cond_3
    add-int/lit8 v10, v10, 0x4

    const/4 v1, 0x4

    goto/16 :goto_0

    :cond_4
    const/4 v1, 0x0

    .line 2515
    :goto_3
    iget v2, v7, Lcom/radaee/reader/GLView$PDFGLPageSet;->pages_cnt:I

    if-ge v1, v2, :cond_6

    .line 2516
    iget-object v2, v7, Lcom/radaee/reader/GLView$PDFGLPageSet;->pages:[Lcom/radaee/view/GLPage;

    aget-object v2, v2, v1

    .line 2517
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6, v2}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 2518
    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2519
    iget-object v6, v0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v6, :cond_5

    .line 2520
    invoke-virtual {v2}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v2

    invoke-interface {v6, v2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 2523
    :cond_6
    iput v3, v0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2524
    iput-object v4, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 2525
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v1, :cond_7

    invoke-virtual {v1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    .line 2526
    :cond_7
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_icon:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_8

    .line 2527
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 2528
    :cond_8
    iput-object v4, v0, Lcom/radaee/reader/GLView;->m_icon:Landroid/graphics/Bitmap;

    return v5

    .line 2532
    :cond_9
    iput v3, v0, Lcom/radaee/reader/GLView;->m_status:I

    .line 2533
    iput-object v4, v0, Lcom/radaee/reader/GLView;->m_rects:[F

    .line 2534
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v1, :cond_a

    invoke-virtual {v1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    .line 2535
    :cond_a
    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_icon:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_b

    .line 2536
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 2537
    :cond_b
    iput-object v4, v0, Lcom/radaee/reader/GLView;->m_icon:Landroid/graphics/Bitmap;

    :goto_4
    return v3
.end method

.method public PDFSetView(I)V
    .locals 1

    const/4 v0, 0x0

    .line 863
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->is_waitting:Z

    .line 864
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->is_notified:Z

    .line 865
    new-instance v0, Lcom/radaee/reader/GLView$8;

    invoke-direct {v0, p0, p1}, Lcom/radaee/reader/GLView$8;-><init>(Lcom/radaee/reader/GLView;I)V

    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    .line 964
    invoke-direct {p0}, Lcom/radaee/reader/GLView;->wait_init()V

    return-void
.end method

.method public PDFSetZoom(IILcom/radaee/view/GLLayout$PDFPos;F)V
    .locals 7

    const/4 v0, 0x0

    .line 3127
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->is_waitting:Z

    .line 3128
    iput-boolean v0, p0, Lcom/radaee/reader/GLView;->is_notified:Z

    .line 3129
    new-instance v1, Lcom/radaee/reader/GLView$26;

    move-object v2, p0

    move v4, p1

    move v5, p2

    move-object v6, p3

    move v3, p4

    invoke-direct/range {v1 .. v6}, Lcom/radaee/reader/GLView$26;-><init>(Lcom/radaee/reader/GLView;FIILcom/radaee/view/GLLayout$PDFPos;)V

    invoke-virtual {p0, v1}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    .line 3140
    invoke-direct {p0}, Lcom/radaee/reader/GLView;->wait_init()V

    return-void
.end method

.method public PDFUndo()V
    .locals 4

    .line 2913
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_opstack:Lcom/radaee/reader/PDFLayoutOPStack;

    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutOPStack;->undo()Lcom/radaee/reader/OPItem;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 2915
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/OPItem;->op_undo(Lcom/radaee/pdf/Document;)V

    .line 2916
    invoke-virtual {v0, v1}, Lcom/radaee/reader/OPItem;->get_pgno(I)I

    move-result v1

    const/4 v2, 0x1

    .line 2917
    invoke-virtual {v0, v2}, Lcom/radaee/reader/OPItem;->get_pgno(I)I

    move-result v2

    .line 2918
    iget v3, v0, Lcom/radaee/reader/OPItem;->m_pageno:I

    invoke-virtual {p0, v3}, Lcom/radaee/reader/GLView;->PDFGotoPage(I)V

    if-ne v1, v2, :cond_0

    .line 2921
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v2, v0, Lcom/radaee/reader/OPItem;->m_pageno:I

    invoke-virtual {v1, v2}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 2922
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2923
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v1, :cond_1

    iget v0, v0, Lcom/radaee/reader/OPItem;->m_pageno:I

    invoke-interface {v1, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    return-void

    .line 2927
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 2928
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0, v2}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 2929
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 2930
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v0, :cond_1

    .line 2932
    invoke-interface {v0, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 2933
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    invoke-interface {v0, v2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_1
    return-void

    .line 2937
    :cond_2
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "No more undo."

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public PDFUpdateCurrPage()V
    .locals 2

    .line 2995
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_0

    .line 2996
    iget v0, p0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->PDFUpdatePage(I)V

    .line 2997
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    if-eqz v0, :cond_0

    iget v0, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    iget v1, p0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    if-eq v0, v1, :cond_0

    .line 2998
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    iget v0, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->PDFUpdatePage(I)V

    :cond_0
    return-void
.end method

.method public PDFUpdatePage(I)V
    .locals 1

    .line 3004
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_1

    .line 3005
    invoke-virtual {v0, p1}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 3006
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0, p1}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;)V

    .line 3007
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    :cond_1
    return-void
.end method

.method public addFreeText(Landroid/view/MotionEvent;Ljava/lang/String;)V
    .locals 13

    .line 3236
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 3237
    sget v1, Lcom/radaee/pdf/Global;->freeTextSize:F

    .line 3238
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 3239
    invoke-virtual {p0, p2, v0}, Lcom/radaee/reader/GLView;->getFreeTextWidth(Ljava/lang/String;Landroid/text/TextPaint;)F

    move-result v0

    const/high16 v2, 0x42d20000    # 105.0f

    mul-float v0, v0, v2

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v0, v2

    .line 3240
    invoke-virtual {p0, p2}, Lcom/radaee/reader/GLView;->getFreeTextLineCount(Ljava/lang/String;)I

    move-result v3

    .line 3242
    iget-object v4, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {v4, v5, p1}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    .line 3243
    iget-object v4, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v5, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v4, v5}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v4

    .line 3244
    iget-object v5, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v4

    invoke-virtual {v5, v4}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v6

    const/4 v4, 0x4

    .line 3246
    new-array v7, v4, [F

    .line 3247
    iget v4, p1, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    const/4 v5, 0x0

    aput v4, v7, v5

    .line 3248
    iget p1, p1, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    const/high16 v4, 0x42480000    # 50.0f

    mul-float v4, v4, v1

    div-float/2addr v4, v2

    sub-float/2addr p1, v4

    const/4 v2, 0x1

    aput p1, v7, v2

    .line 3249
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

    .line 3250
    aput p1, v7, v0

    .line 3252
    invoke-virtual {v6}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 3253
    sget v11, Lcom/radaee/pdf/Global;->freeTextSize:F

    sget v12, Lcom/radaee/pdf/Global;->inkColor:I

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v6 .. v12}, Lcom/radaee/pdf/Page;->AddAnnotEditbox([FIFIFI)Z

    .line 3254
    invoke-virtual {v6}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result p1

    sub-int/2addr p1, v2

    invoke-virtual {v6, p1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 3257
    :cond_0
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetEditText(Ljava/lang/String;)Z

    .line 3258
    sget v0, Lcom/radaee/pdf/Global;->inkColor:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetEditTextColor(I)Z

    .line 3259
    sget v0, Lcom/radaee/pdf/Global;->inkColor:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetFillColor(I)Z

    .line 3260
    sget v0, Lcom/radaee/pdf/Global;->inkColor:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetStrokeColor(I)Z

    .line 3261
    invoke-virtual {p0, p2, p1}, Lcom/radaee/reader/GLView;->setEditFontIfHasOtherLetter(Ljava/lang/String;Lcom/radaee/pdf/Page$Annotation;)V

    .line 3263
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFUpdateCurrPage()V

    return-void
.end method

.method public addNoteAtPoint(Landroid/view/MotionEvent;Ljava/lang/String;)Z
    .locals 9

    .line 1640
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {v0, v1, p1}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    .line 1641
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v1, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v0

    .line 1642
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    .line 1644
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1645
    iget-object v3, p0, Lcom/radaee/reader/GLView;->m_note_pages:[Lcom/radaee/view/GLPage;

    const/4 v4, 0x1

    if-nez v3, :cond_0

    .line 1646
    new-array v3, v4, [Lcom/radaee/view/GLPage;

    iput-object v3, p0, Lcom/radaee/reader/GLView;->m_note_pages:[Lcom/radaee/view/GLPage;

    .line 1647
    new-array v5, v4, [I

    iput-object v5, p0, Lcom/radaee/reader/GLView;->m_note_indecs:[I

    .line 1648
    aput-object v0, v3, v2

    .line 1649
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v3

    aput v3, v5, v2

    goto :goto_3

    .line 1652
    :cond_0
    array-length v3, v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_2

    .line 1654
    iget-object v6, p0, Lcom/radaee/reader/GLView;->m_note_pages:[Lcom/radaee/view/GLPage;

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

    .line 1659
    new-array v6, v5, [Lcom/radaee/view/GLPage;

    .line 1660
    new-array v5, v5, [I

    const/4 v7, 0x0

    :goto_2
    if-ge v7, v3, :cond_3

    .line 1662
    iget-object v8, p0, Lcom/radaee/reader/GLView;->m_note_pages:[Lcom/radaee/view/GLPage;

    aget-object v8, v8, v7

    aput-object v8, v6, v7

    .line 1663
    iget-object v8, p0, Lcom/radaee/reader/GLView;->m_note_indecs:[I

    aget v8, v8, v7

    aput v8, v5, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 1665
    :cond_3
    aput-object v0, v6, v3

    .line 1666
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v7

    aput v7, v5, v3

    .line 1667
    iput-object v6, p0, Lcom/radaee/reader/GLView;->m_note_pages:[Lcom/radaee/view/GLPage;

    .line 1668
    iput-object v5, p0, Lcom/radaee/reader/GLView;->m_note_indecs:[I

    .line 1672
    :cond_4
    :goto_3
    iget v3, p1, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    .line 1673
    iget p1, p1, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    const/4 v5, 0x2

    new-array v5, v5, [F

    aput v3, v5, v2

    aput p1, v5, v4

    .line 1674
    invoke-virtual {v1, v5}, Lcom/radaee/pdf/Page;->AddAnnotText([F)Z

    .line 1675
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result p1

    sub-int/2addr p1, v4

    invoke-virtual {v1, p1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object p1

    .line 1676
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    if-eqz p1, :cond_5

    if-eqz p2, :cond_5

    .line 1678
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetPopupText(Ljava/lang/String;)Z

    .line 1683
    :cond_5
    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_pg:Lcom/radaee/pdf/Page;

    .line 1684
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result p1

    sub-int/2addr p1, v4

    invoke-virtual {v1, p1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 1685
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_rect:[F

    .line 1686
    iget-object p2, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p2, v0, p1}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;[F)V

    .line 1687
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 1688
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->Close()V

    .line 1690
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_6

    .line 1691
    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result p2

    invoke-interface {p1, p2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_6
    return v4

    :cond_7
    return v2
.end method

.method public delForceSel(Z)V
    .locals 2

    const/4 v0, -0x1

    .line 1289
    iput v0, p0, Lcom/radaee/reader/GLView;->force_sel_end:I

    iput v0, p0, Lcom/radaee/reader/GLView;->force_sel_start:I

    const/4 v0, 0x0

    .line 1290
    iput v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v0, 0x0

    .line 1291
    iput-object v0, p0, Lcom/radaee/reader/GLView;->tts_annot_page:Lcom/radaee/view/GLPage;

    .line 1292
    iput-object v0, p0, Lcom/radaee/reader/GLView;->ttsPara:Landroid/graphics/RectF;

    .line 1293
    iget-object v1, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    if-eqz v1, :cond_0

    .line 1294
    invoke-virtual {v1}, Lcom/radaee/view/VSel;->Clear()V

    .line 1295
    iput-object v0, p0, Lcom/radaee/reader/GLView;->tts_sel:Lcom/radaee/view/VSel;

    :cond_0
    if-eqz p1, :cond_1

    .line 1299
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->doInvalidate()V

    :cond_1
    return-void
.end method

.method public doInvalidate()V
    .locals 1

    .line 2379
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->invalidate()V

    .line 2380
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    .line 2381
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method

.method public doPostInvalidate()V
    .locals 1

    .line 2385
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->postInvalidate()V

    .line 2386
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/reader/GLCanvas;->postInvalidate()V

    .line 2387
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method

.method public doTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1711
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 1712
    :cond_0
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchNone(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    return v1

    .line 1713
    :cond_1
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchZoom(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    .line 1714
    :cond_2
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchSelect(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v1

    .line 1715
    :cond_3
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchInk(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_4

    return v1

    .line 1716
    :cond_4
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchRect(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_5

    return v1

    .line 1717
    :cond_5
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchEllipse(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_6

    return v1

    .line 1718
    :cond_6
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchNote(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_7

    return v1

    .line 1719
    :cond_7
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchLine(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_8

    return v1

    .line 1720
    :cond_8
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchStamp(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_9

    return v1

    .line 1721
    :cond_9
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchEditbox(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_a

    return v1

    .line 1722
    :cond_a
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchPolygon(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_b

    return v1

    .line 1723
    :cond_b
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchPolyline(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_c

    return v1

    .line 1724
    :cond_c
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onTouchAnnot(Landroid/view/MotionEvent;)Z

    return v1
.end method

.method public drawLayer(Landroid/graphics/Canvas;)V
    .locals 6

    const-string v0, "AvialMem:"

    .line 1994
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v1, :cond_0

    .line 1995
    invoke-virtual {v1, p1}, Lcom/radaee/view/GLLayout;->vFindDraw(Landroid/graphics/Canvas;)V

    .line 1996
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onDrawSelect(Landroid/graphics/Canvas;)V

    .line 1997
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onDrawRect(Landroid/graphics/Canvas;)V

    .line 1998
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onDrawEllipse(Landroid/graphics/Canvas;)V

    .line 1999
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onDrawAnnot(Landroid/graphics/Canvas;)V

    .line 2000
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onDrawLine(Landroid/graphics/Canvas;)V

    .line 2001
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onDrawStamp(Landroid/graphics/Canvas;)V

    .line 2002
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onDrawEditbox(Landroid/graphics/Canvas;)V

    .line 2003
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onDrawPolygon(Landroid/graphics/Canvas;)V

    .line 2004
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView;->onDrawPolyline(Landroid/graphics/Canvas;)V

    .line 2005
    iget v1, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_ink:Lcom/radaee/pdf/Ink;

    if-eqz v1, :cond_0

    const/4 v2, 0x0

    .line 2006
    invoke-virtual {v1, p1, v2, v2}, Lcom/radaee/pdf/Ink;->OnDraw(Landroid/graphics/Canvas;FF)V

    .line 2008
    :cond_0
    sget-boolean v1, Lcom/radaee/pdf/Global;->debug_mode:Z

    if-eqz v1, :cond_2

    .line 2010
    :try_start_0
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_amgr:Landroid/app/ActivityManager;

    if-nez v1, :cond_1

    .line 2011
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "activity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    iput-object v1, p0, Lcom/radaee/reader/GLView;->m_amgr:Landroid/app/ActivityManager;

    .line 2012
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_info_paint:Landroid/graphics/Paint;

    const/high16 v2, -0x10000

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 2013
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_info_paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41f00000    # 30.0f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 2015
    :cond_1
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_amgr:Landroid/app/ActivityManager;

    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_info:Landroid/app/ActivityManager$MemoryInfo;

    invoke-virtual {v1, v2}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 2016
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_info:Landroid/app/ActivityManager$MemoryInfo;

    iget-wide v2, v0, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    const-wide/32 v4, 0x100000

    div-long/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " M"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_info_paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41a00000    # 20.0f

    const/high16 v3, 0x43160000    # 150.0f

    invoke-virtual {p1, v0, v2, v3, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 2018
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    return-void
.end method

.method public executeAnnotation()Z
    .locals 11

    .line 2707
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v1, 0x64

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    goto/16 :goto_1

    .line 2708
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v1}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 2709
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-nez v1, :cond_1

    goto/16 :goto_1

    .line 2710
    :cond_1
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2711
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetDest()I

    move-result v1

    const/4 v3, 0x1

    if-ltz v1, :cond_4

    .line 2713
    iget-object v2, p0, Lcom/radaee/reader/GLView;->beforePageJump:Lcom/radaee/reader/GLView$OnBeforeLinkJump;

    if-eqz v2, :cond_2

    .line 2714
    invoke-interface {v2, v1}, Lcom/radaee/reader/GLView$OnBeforeLinkJump;->beforePageJump(I)V

    .line 2715
    :cond_2
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v2, v1}, Lcom/radaee/view/GLLayout;->vGotoPage(I)V

    .line 2716
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 2717
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    .line 2718
    :cond_3
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->requestRender()V

    return v3

    .line 2721
    :cond_4
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetJS()Ljava/lang/String;

    move-result-object v1

    .line 2722
    sget-boolean v4, Lcom/radaee/pdf/Global;->sExecuteAnnotJS:Z

    if-eqz v4, :cond_5

    .line 2723
    invoke-direct {p0}, Lcom/radaee/reader/GLView;->executeAnnotJS()Z

    move-result v4

    if-eqz v4, :cond_5

    const/4 v2, 0x1

    .line 2725
    :cond_5
    iget-object v4, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v4, :cond_6

    if-eqz v1, :cond_6

    .line 2726
    invoke-interface {v4, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpenJS(Ljava/lang/String;)V

    .line 2727
    :cond_6
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetURI()Ljava/lang/String;

    move-result-object v1

    .line 2728
    iget-object v4, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v4, :cond_7

    if-eqz v1, :cond_7

    .line 2729
    invoke-interface {v4, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpenURI(Ljava/lang/String;)V

    const/4 v2, 0x1

    .line 2733
    :cond_7
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetMovie()Ljava/lang/String;

    move-result-object v1

    const/16 v4, 0x3a

    .line 2734
    const-string v5, "/"

    const/16 v6, 0x2f

    const/16 v7, 0x5c

    if-eqz v1, :cond_b

    .line 2736
    invoke-virtual {v1, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    if-gez v2, :cond_8

    .line 2737
    invoke-virtual {v1, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    :cond_8
    if-gez v2, :cond_9

    .line 2738
    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 2739
    :cond_9
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

    .line 2740
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v2, v1}, Lcom/radaee/pdf/Page$Annotation;->GetMovieData(Ljava/lang/String;)Z

    .line 2741
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v2, :cond_a

    .line 2742
    invoke-interface {v2, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpenMovie(Ljava/lang/String;)V

    :cond_a
    const/4 v2, 0x1

    .line 2745
    :cond_b
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetSound()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_f

    const/4 v2, 0x4

    .line 2747
    new-array v2, v2, [I

    .line 2749
    invoke-virtual {v1, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    if-gez v8, :cond_c

    .line 2750
    invoke-virtual {v1, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    :cond_c
    if-gez v8, :cond_d

    .line 2751
    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    .line 2752
    :cond_d
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

    .line 2753
    iget-object v8, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v8, v2, v1}, Lcom/radaee/pdf/Page$Annotation;->GetSoundData([ILjava/lang/String;)Z

    .line 2754
    iget-object v8, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v8, :cond_e

    .line 2755
    invoke-interface {v8, v2, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpenSound([ILjava/lang/String;)V

    :cond_e
    const/4 v2, 0x1

    .line 2758
    :cond_f
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetAttachment()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_13

    .line 2761
    invoke-virtual {v1, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    if-gez v2, :cond_10

    .line 2762
    invoke-virtual {v1, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    :cond_10
    if-gez v2, :cond_11

    .line 2763
    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 2764
    :cond_11
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

    .line 2765
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v2, v1}, Lcom/radaee/pdf/Page$Annotation;->GetAttachmentData(Ljava/lang/String;)Z

    .line 2766
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v2, :cond_12

    .line 2767
    invoke-interface {v2, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpenAttachment(Ljava/lang/String;)V

    :cond_12
    const/4 v2, 0x1

    .line 2770
    :cond_13
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->Get3D()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_17

    .line 2773
    invoke-virtual {v1, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    if-gez v2, :cond_14

    .line 2774
    invoke-virtual {v1, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    :cond_14
    if-gez v2, :cond_15

    .line 2775
    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 2776
    :cond_15
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

    .line 2777
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v2, v1}, Lcom/radaee/pdf/Page$Annotation;->Get3DData(Ljava/lang/String;)Z

    .line 2778
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v2, :cond_16

    .line 2779
    invoke-interface {v2, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpen3D(Ljava/lang/String;)V

    :cond_16
    const/4 v2, 0x1

    .line 2783
    :cond_17
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetReset()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 2784
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFCanSave()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 2785
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->SetReset()Z

    .line 2786
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v1}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/radaee/reader/GLView;->PDFUpdatePage(I)V

    .line 2787
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v1, :cond_18

    .line 2788
    iget-object v4, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v4

    invoke-interface {v1, v4}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 2790
    :cond_18
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetSubmitTarget()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_19

    .line 2792
    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v2, :cond_1a

    .line 2793
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "?"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetSubmitTarget()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpenURI(Ljava/lang/String;)V

    goto :goto_0

    :cond_19
    move v3, v2

    .line 2796
    :cond_1a
    :goto_0
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    return v3

    :cond_1b
    :goto_1
    return v2
.end method

.method public getBitmap(Lcom/radaee/reader/GLView$OnPixelCopy;)V
    .locals 3

    .line 110
    sget-boolean v0, Lcom/radaee/pdf/Global;->dark_mode:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 111
    invoke-interface {p1, v1}, Lcom/radaee/reader/GLView$OnPixelCopy;->onSuccessCallback(Landroid/graphics/Bitmap;)V

    return-void

    .line 114
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v0, v2, :cond_1

    .line 115
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getWidth()I

    move-result v0

    .line 116
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getHeight()I

    move-result v1

    .line 117
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 118
    new-instance v1, Lcom/radaee/reader/GLView$1;

    invoke-direct {v1, p0, p1, v0}, Lcom/radaee/reader/GLView$1;-><init>(Lcom/radaee/reader/GLView;Lcom/radaee/reader/GLView$OnPixelCopy;Landroid/graphics/Bitmap;)V

    new-instance p1, Landroid/os/Handler;

    .line 127
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {p1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 118
    invoke-static {p0, v0, v1, p1}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m(Landroid/view/SurfaceView;Landroid/graphics/Bitmap;Landroid/view/PixelCopy$OnPixelCopyFinishedListener;Landroid/os/Handler;)V

    return-void

    .line 129
    :cond_1
    invoke-interface {p1, v1}, Lcom/radaee/reader/GLView$OnPixelCopy;->onSuccessCallback(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public getFreeTextLineCount(Ljava/lang/String;)I
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 3286
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

    .line 3270
    :goto_0
    const-string v2, "\n"

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 3271
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    goto :goto_1

    :cond_0
    move v4, v2

    .line 3272
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

    .line 3204
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 3205
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

    .line 498
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

    .line 3295
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

.method public onEditPopup()V
    .locals 3

    .line 2669
    iget v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    const/16 v1, 0x64

    if-eq v0, v1, :cond_0

    return-void

    .line 2670
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFCanSave()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2671
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->cannot_write_or_encrypted:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 2672
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFEndAnnot()V

    return-void

    .line 2675
    :cond_1
    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgPopup;

    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/radaee/annotui/UIAnnotDlgPopup;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    new-instance v2, Lcom/radaee/reader/GLView$19;

    invoke-direct {v2, p0}, Lcom/radaee/reader/GLView$19;-><init>(Lcom/radaee/reader/GLView;)V

    invoke-virtual {v0, v1, v2}, Lcom/radaee/annotui/UIAnnotDlgPopup;->show(Lcom/radaee/pdf/Page$Annotation;Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V

    return-void
.end method

.method public setAnnotMenu(Lcom/radaee/annotui/UIAnnotMenu;)V
    .locals 0

    .line 695
    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_aMenu:Lcom/radaee/annotui/UIAnnotMenu;

    return-void
.end method

.method public setDisabled(Z)V
    .locals 0

    .line 3320
    iput-boolean p1, p0, Lcom/radaee/reader/GLView;->disabled:Z

    return-void
.end method

.method public setEditFontIfHasOtherLetter(Ljava/lang/String;Lcom/radaee/pdf/Page$Annotation;)V
    .locals 0

    .line 3199
    invoke-virtual {p0, p1}, Lcom/radaee/reader/GLView;->hasOtherLetter(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 3200
    invoke-virtual {p0, p2}, Lcom/radaee/reader/GLView;->setEditFontWithOtherLetter(Lcom/radaee/pdf/Page$Annotation;)V

    :cond_0
    return-void
.end method

.method public setEditFontWithOtherLetter(Lcom/radaee/pdf/Page$Annotation;)V
    .locals 1

    .line 3212
    :try_start_0
    invoke-direct {p0}, Lcom/radaee/reader/GLView;->getOtherLetterFont()Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3214
    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetEditFont(Lcom/radaee/pdf/Document$DocFont;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 3216
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    return-void
.end method

.method public setForceSel(II)V
    .locals 0

    .line 1282
    iput p1, p0, Lcom/radaee/reader/GLView;->force_sel_start:I

    .line 1283
    iput p2, p0, Lcom/radaee/reader/GLView;->force_sel_end:I

    .line 1284
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->doPostInvalidate()V

    return-void
.end method

.method public setReadOnly(Z)V
    .locals 0

    .line 2969
    iput-boolean p1, p0, Lcom/radaee/reader/GLView;->mReadOnly:Z

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1

    .line 525
    iget-boolean v0, p0, Lcom/radaee/reader/GLView;->disabled:Z

    if-nez v0, :cond_0

    .line 526
    invoke-super {p0, p1, p2, p3, p4}, Landroid/opengl/GLSurfaceView;->surfaceChanged(Landroid/view/SurfaceHolder;III)V

    :cond_0
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 636
    const-string v0, "GLView"

    const-string v1, "surfaceCreated"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 637
    new-instance v0, Lcom/radaee/reader/GLView$3;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$3;-><init>(Lcom/radaee/reader/GLView;)V

    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    .line 644
    invoke-super {p0, p1}, Landroid/opengl/GLSurfaceView;->surfaceCreated(Landroid/view/SurfaceHolder;)V

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 650
    const-string v0, "GLView"

    const-string v1, "surfaceDestroyed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 651
    new-instance v0, Lcom/radaee/reader/GLView$4;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$4;-><init>(Lcom/radaee/reader/GLView;)V

    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    .line 658
    invoke-super {p0, p1}, Landroid/opengl/GLSurfaceView;->surfaceDestroyed(Landroid/view/SurfaceHolder;)V

    return-void
.end method

.method public toPDFRect([F)[F
    .locals 3

    .line 3016
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_0

    .line 3017
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->PDFGetCurrPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v0

    .line 3018
    iget-object v1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v1}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v2}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/radaee/view/GLPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v0

    .line 3019
    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Matrix;->TransformRect([F)V

    :cond_0
    return-object p1
.end method

.method public updateFreeText(Lcom/radaee/pdf/Page$Annotation;Ljava/lang/String;)V
    .locals 0

    .line 3304
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetEditText(Ljava/lang/String;)Z

    .line 3305
    invoke-virtual {p0, p2, p1}, Lcom/radaee/reader/GLView;->setEditFontIfHasOtherLetter(Ljava/lang/String;Lcom/radaee/pdf/Page$Annotation;)V

    .line 3306
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetFillColor()I

    move-result p2

    if-eqz p2, :cond_0

    .line 3307
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetFillColor()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetEditTextColor(I)Z

    :cond_0
    const/4 p2, 0x0

    .line 3308
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetFillColor(I)Z

    .line 3309
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetStrokeColor(I)Z

    return-void
.end method

.method public zSetSelect(ZZIIIILcom/radaee/reader/GLView$OnAfterSelect;)V
    .locals 6

    .line 1307
    iget v0, p0, Lcom/radaee/reader/GLView;->force_sel_start:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    .line 1308
    invoke-virtual {p0, v0}, Lcom/radaee/reader/GLView;->delForceSel(Z)V

    :cond_0
    const/4 v0, 0x2

    .line 1311
    iput v0, p0, Lcom/radaee/reader/GLView;->m_status:I

    int-to-float p3, p3

    .line 1312
    iput p3, p0, Lcom/radaee/reader/GLView;->m_hold_x:F

    int-to-float p3, p4

    .line 1313
    iput p3, p0, Lcom/radaee/reader/GLView;->m_hold_y:F

    .line 1314
    iget-object p3, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    if-eqz p3, :cond_1

    if-eqz p1, :cond_4

    :cond_1
    if-eqz p3, :cond_2

    .line 1316
    invoke-virtual {p3}, Lcom/radaee/view/VSel;->Clear()V

    const/4 p1, 0x0

    .line 1317
    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    .line 1319
    :cond_2
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget p3, p0, Lcom/radaee/reader/GLView;->m_hold_x:F

    float-to-int p3, p3

    iget p4, p0, Lcom/radaee/reader/GLView;->m_hold_y:F

    float-to-int p4, p4

    invoke-virtual {p1, p3, p4}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    if-nez p1, :cond_3

    goto/16 :goto_0

    .line 1322
    :cond_3
    iget-object p3, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget p1, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {p3, p1}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 1323
    new-instance p1, Lcom/radaee/view/VSel;

    iget-object p3, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    iget-object p4, p0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    iget p4, p4, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {p3, p4}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p3

    invoke-direct {p1, p3}, Lcom/radaee/view/VSel;-><init>(Lcom/radaee/pdf/Page;)V

    iput-object p1, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    .line 1326
    :cond_4
    iget-object v0, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    iget v1, p1, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    iget v2, p1, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    int-to-float p3, p5

    iget-object p4, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    .line 1327
    invoke-virtual {p4}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result p4

    int-to-float p4, p4

    invoke-virtual {p1, p3, p4}, Lcom/radaee/view/GLPage;->ToPDFX(FF)F

    move-result v3

    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    int-to-float p3, p6

    iget-object p4, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    .line 1328
    invoke-virtual {p4}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result p4

    int-to-float p4, p4

    invoke-virtual {p1, p3, p4}, Lcom/radaee/view/GLPage;->ToPDFY(FF)F

    move-result v4

    move v5, p2

    .line 1326
    invoke-virtual/range {v0 .. v5}, Lcom/radaee/view/VSel;->SetSel(FFFFZ)V

    .line 1329
    invoke-virtual {p0}, Lcom/radaee/reader/GLView;->doInvalidate()V

    .line 1330
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_5

    .line 1331
    iget-object p2, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    invoke-virtual {p2}, Lcom/radaee/view/VSel;->GetSelString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFSelectEnd(Ljava/lang/String;)V

    :cond_5
    if-eqz p7, :cond_6

    .line 1335
    iget-object p1, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result p1

    iget-object p2, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p2}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result p2

    sub-int/2addr p1, p2

    .line 1336
    iget-object p2, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    iget-object p3, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p2}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result p4

    invoke-virtual {p3, p4}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p3

    invoke-virtual {p2, p3}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result p2

    iget-object p3, p0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p3}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result p3

    sub-int/2addr p2, p3

    .line 1337
    iget-object p3, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {p3}, Lcom/radaee/view/GLPage;->GetScale()F

    move-result p3

    .line 1338
    iget-object p4, p0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    iget-object p5, p0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {p5}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result p5

    invoke-virtual {p4, p5}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p4

    .line 1339
    iget-object p5, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    invoke-virtual {p5}, Lcom/radaee/view/VSel;->GetSelString()Ljava/lang/String;

    move-result-object v1

    iget-object p5, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    iget v2, p5, Lcom/radaee/view/VSel;->m_index1:I

    iget-object p5, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    iget v3, p5, Lcom/radaee/view/VSel;->m_index2:I

    iget-object p5, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    .line 1341
    invoke-virtual {p5, p3, p4, p1, p2}, Lcom/radaee/view/VSel;->GetRect1(FFII)[I

    move-result-object v4

    iget-object p5, p0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    .line 1342
    invoke-virtual {p5, p3, p4, p1, p2}, Lcom/radaee/view/VSel;->GetRect2(FFII)[I

    move-result-object v5

    move-object v0, p7

    .line 1339
    invoke-interface/range {v0 .. v5}, Lcom/radaee/reader/GLView$OnAfterSelect;->onAfterSelect(Ljava/lang/String;II[I[I)V

    :cond_6
    :goto_0
    return-void
.end method
