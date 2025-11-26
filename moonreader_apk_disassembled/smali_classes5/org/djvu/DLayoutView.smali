.class public Lorg/djvu/DLayoutView;
.super Landroid/view/View;
.source "DLayoutView.java"

# interfaces
.implements Lorg/djvu/IDLayoutView;
.implements Lorg/djvu/DLayout$LayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/djvu/DLayoutView$DjvuGestureListener;,
        Lorg/djvu/DLayoutView$OnAfterSelect;
    }
.end annotation


# static fields
.field public static def_view:I = 0x0

.field public static selColor:I = 0x400000c0


# instance fields
.field force_sel_end:I

.field force_sel_start:I

.field public m_annot_page:Lorg/djvu/VDPage;

.field public m_annot_pos:Lorg/djvu/DLayout$DjvuPos;

.field public m_doc:Lorg/djvu/DDocument;

.field public m_gesture:Landroid/view/GestureDetector;

.field public m_goto_pos:Lorg/djvu/DLayout$DjvuPos;

.field public m_hold:Z

.field private m_hold_docx:I

.field private m_hold_docy:I

.field private m_hold_x:F

.field private m_hold_y:F

.field public m_info_paint:Landroid/graphics/Paint;

.field public m_layout:Lorg/djvu/DLayout;

.field public m_listener:Lorg/djvu/IDLayoutView$DjvuLayoutListener;

.field public m_pageno:I

.field public m_sel:Lorg/djvu/VDSel;

.field public m_status:I

.field private m_zoom_dis0:F

.field private m_zoom_pos:Lorg/djvu/DLayout$DjvuPos;

.field private m_zoom_scale:F

.field public scoll_lock:Z

.field themeBitmap:Landroid/graphics/Bitmap;

.field themeCanvas:Landroid/graphics/Canvas;

.field public ttsPara:Landroid/graphics/RectF;

.field public tts_annot_page:Lorg/djvu/VDPage;

.field public tts_sel:Lorg/djvu/VDSel;


# direct methods
.method static bridge synthetic -$$Nest$fgetm_hold_docx(Lorg/djvu/DLayoutView;)I
    .locals 0

    iget p0, p0, Lorg/djvu/DLayoutView;->m_hold_docx:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetm_hold_docy(Lorg/djvu/DLayoutView;)I
    .locals 0

    iget p0, p0, Lorg/djvu/DLayoutView;->m_hold_docy:I

    return p0
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 45
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Lorg/djvu/DLayoutView;->scoll_lock:Z

    .line 32
    iput v0, p0, Lorg/djvu/DLayoutView;->m_status:I

    .line 33
    iput v0, p0, Lorg/djvu/DLayoutView;->m_pageno:I

    const/4 v1, 0x0

    .line 34
    iput-object v1, p0, Lorg/djvu/DLayoutView;->m_goto_pos:Lorg/djvu/DLayout$DjvuPos;

    .line 37
    iput-object v1, p0, Lorg/djvu/DLayoutView;->m_annot_pos:Lorg/djvu/DLayout$DjvuPos;

    .line 38
    iput-object v1, p0, Lorg/djvu/DLayoutView;->m_annot_page:Lorg/djvu/VDPage;

    .line 41
    iput-object v1, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    .line 229
    iput-boolean v0, p0, Lorg/djvu/DLayoutView;->m_hold:Z

    .line 475
    iput-object v1, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    .line 476
    iput-object v1, p0, Lorg/djvu/DLayoutView;->tts_annot_page:Lorg/djvu/VDPage;

    const/4 v0, -0x1

    .line 477
    iput v0, p0, Lorg/djvu/DLayoutView;->force_sel_start:I

    iput v0, p0, Lorg/djvu/DLayoutView;->force_sel_end:I

    .line 46
    iput-object v1, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    .line 47
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lorg/djvu/DLayoutView$DjvuGestureListener;

    invoke-direct {v1, p0}, Lorg/djvu/DLayoutView$DjvuGestureListener;-><init>(Lorg/djvu/DLayoutView;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lorg/djvu/DLayoutView;->m_gesture:Landroid/view/GestureDetector;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 52
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 29
    iput-boolean p2, p0, Lorg/djvu/DLayoutView;->scoll_lock:Z

    .line 32
    iput p2, p0, Lorg/djvu/DLayoutView;->m_status:I

    .line 33
    iput p2, p0, Lorg/djvu/DLayoutView;->m_pageno:I

    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Lorg/djvu/DLayoutView;->m_goto_pos:Lorg/djvu/DLayout$DjvuPos;

    .line 37
    iput-object v0, p0, Lorg/djvu/DLayoutView;->m_annot_pos:Lorg/djvu/DLayout$DjvuPos;

    .line 38
    iput-object v0, p0, Lorg/djvu/DLayoutView;->m_annot_page:Lorg/djvu/VDPage;

    .line 41
    iput-object v0, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    .line 229
    iput-boolean p2, p0, Lorg/djvu/DLayoutView;->m_hold:Z

    .line 475
    iput-object v0, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    .line 476
    iput-object v0, p0, Lorg/djvu/DLayoutView;->tts_annot_page:Lorg/djvu/VDPage;

    const/4 p2, -0x1

    .line 477
    iput p2, p0, Lorg/djvu/DLayoutView;->force_sel_start:I

    iput p2, p0, Lorg/djvu/DLayoutView;->force_sel_end:I

    .line 53
    iput-object v0, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    .line 54
    new-instance p2, Landroid/view/GestureDetector;

    new-instance v0, Lorg/djvu/DLayoutView$DjvuGestureListener;

    invoke-direct {v0, p0}, Lorg/djvu/DLayoutView$DjvuGestureListener;-><init>(Lorg/djvu/DLayoutView;)V

    invoke-direct {p2, p1, v0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p2, p0, Lorg/djvu/DLayoutView;->m_gesture:Landroid/view/GestureDetector;

    return-void
.end method

.method private doOnDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 158
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-eqz v0, :cond_1

    .line 159
    iget v0, v0, Lorg/djvu/DLayout;->m_back_color:I

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 160
    iget-object v1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v0, p0, Lorg/djvu/DLayoutView;->m_status:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    const/4 v4, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getWidth()I

    move-result v5

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getHeight()I

    move-result v6

    move-object v2, p0

    move-object v3, p1

    invoke-virtual/range {v1 .. v6}, Lorg/djvu/DLayout;->vDraw(Landroid/view/View;Landroid/graphics/Canvas;ZII)V

    .line 161
    invoke-direct {p0, v3}, Lorg/djvu/DLayoutView;->onDrawSelect(Landroid/graphics/Canvas;)V

    goto :goto_1

    :cond_1
    move-object v3, p1

    .line 163
    :goto_1
    invoke-direct {p0, v3}, Lorg/djvu/DLayoutView;->drawDebug(Landroid/graphics/Canvas;)V

    return-void
.end method

.method private drawDebug(Landroid/graphics/Canvas;)V
    .locals 5

    .line 167
    sget-boolean v0, Lcom/radaee/pdf/Global;->debug_mode:Z

    if-eqz v0, :cond_0

    .line 169
    :try_start_0
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getMemoryInfo()Ljava/lang/String;

    move-result-object v0

    .line 170
    iget-object v1, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual {v1, v2}, Lorg/djvu/DDocument;->d(F)I

    move-result v1

    int-to-float v1, v1

    iget-object v3, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    const/high16 v4, 0x42a00000    # 80.0f

    invoke-virtual {v3, v4}, Lorg/djvu/DDocument;->d(F)I

    move-result v3

    int-to-float v3, v3

    invoke-direct {p0}, Lorg/djvu/DLayoutView;->getInfoPaint()Landroid/graphics/Paint;

    move-result-object v4

    invoke-virtual {p1, v0, v1, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lorg/djvu/DLayoutView;->m_pageno:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v1}, Lorg/djvu/DDocument;->GetPageCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    const/high16 v3, 0x42dc0000    # 110.0f

    invoke-virtual {v1, v3}, Lorg/djvu/DDocument;->d(F)I

    move-result v1

    int-to-float v1, v1

    invoke-direct {p0}, Lorg/djvu/DLayoutView;->getInfoPaint()Landroid/graphics/Paint;

    move-result-object v3

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 174
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method private getInfoPaint()Landroid/graphics/Paint;
    .locals 3

    .line 180
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_info_paint:Landroid/graphics/Paint;

    if-nez v0, :cond_0

    .line 181
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/djvu/DLayoutView;->m_info_paint:Landroid/graphics/Paint;

    const/high16 v1, -0x10000

    .line 182
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 183
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_info_paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x41700000    # 15.0f

    mul-float v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 185
    :cond_0
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_info_paint:Landroid/graphics/Paint;

    return-object v0
.end method

.method private onDrawSelect(Landroid/graphics/Canvas;)V
    .locals 6

    .line 442
    iget v0, p0, Lorg/djvu/DLayoutView;->force_sel_start:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_3

    .line 443
    iget-object v0, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/djvu/DLayoutView;->tts_annot_page:Lorg/djvu/VDPage;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/djvu/VDPage;->GetPageNo()I

    move-result v0

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->DjvuGetCurrPage()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 444
    iget-object v0, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    invoke-virtual {v0}, Lorg/djvu/VDSel;->Clear()V

    const/4 v0, 0x0

    .line 445
    iput-object v0, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    .line 447
    :cond_0
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->DjvuGetCurrPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/djvu/DLayout;->vGetPage(I)Lorg/djvu/VDPage;

    move-result-object v0

    iput-object v0, p0, Lorg/djvu/DLayoutView;->tts_annot_page:Lorg/djvu/VDPage;

    .line 448
    iget-object v0, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    if-nez v0, :cond_1

    .line 449
    new-instance v0, Lorg/djvu/VDSel;

    iget-object v1, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    iget-object v3, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->DjvuGetCurrPage()I

    move-result v4

    iget-object v5, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v5, v5, Lorg/djvu/DLayout;->m_scale:F

    invoke-direct {v0, v1, v3, v4, v5}, Lorg/djvu/VDSel;-><init>(Lorg/djvu/DDocument;Lorg/djvu/DLayout;IF)V

    iput-object v0, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    .line 450
    :cond_1
    iget-object v0, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    iget v1, p0, Lorg/djvu/DLayoutView;->force_sel_start:I

    iput v1, v0, Lorg/djvu/VDSel;->m_index1:I

    .line 451
    iget-object v0, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    iget v1, p0, Lorg/djvu/DLayoutView;->force_sel_end:I

    iput v1, v0, Lorg/djvu/VDSel;->m_index2:I

    .line 453
    iget-object v0, p0, Lorg/djvu/DLayoutView;->tts_annot_page:Lorg/djvu/VDPage;

    invoke-virtual {v0, v2}, Lorg/djvu/VDPage;->GetVX(F)I

    move-result v0

    iget-object v1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v1}, Lorg/djvu/DLayout;->vGetX()I

    move-result v1

    sub-int/2addr v0, v1

    .line 455
    iget-object v1, p0, Lorg/djvu/DLayoutView;->tts_annot_page:Lorg/djvu/VDPage;

    invoke-virtual {v1, v2}, Lorg/djvu/VDPage;->GetVY(F)I

    move-result v1

    iget-object v2, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v2}, Lorg/djvu/DLayout;->vGetY()I

    move-result v2

    sub-int/2addr v1, v2

    .line 456
    iget-object v2, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v2}, Lorg/djvu/DLayout;->vGetScale()F

    move-result v2

    .line 458
    iget-object v3, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    iget-boolean v3, v3, Lorg/djvu/VDSel;->m_ok:Z

    if-nez v3, :cond_2

    .line 459
    iget-object v3, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    iget-object v3, v3, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    invoke-virtual {v3}, Lorg/djvu/DPage;->ObjsStart()V

    .line 460
    iget-object v3, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lorg/djvu/VDSel;->m_ok:Z

    .line 462
    :cond_2
    iget-object v3, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    invoke-virtual {v3, p1, v2, v0, v1}, Lorg/djvu/VDSel;->DrawSel(Landroid/graphics/Canvas;FII)V

    .line 463
    iget-object p1, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    iget-object p1, p1, Lorg/djvu/VDSel;->drawPara:Landroid/graphics/RectF;

    iput-object p1, p0, Lorg/djvu/DLayoutView;->ttsPara:Landroid/graphics/RectF;

    return-void

    .line 465
    :cond_3
    iget v0, p0, Lorg/djvu/DLayoutView;->m_status:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_annot_page:Lorg/djvu/VDPage;

    if-eqz v0, :cond_4

    .line 466
    invoke-virtual {v0, v2}, Lorg/djvu/VDPage;->GetVX(F)I

    move-result v0

    iget-object v1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v1}, Lorg/djvu/DLayout;->vGetX()I

    move-result v1

    sub-int/2addr v0, v1

    .line 468
    iget-object v1, p0, Lorg/djvu/DLayoutView;->m_annot_page:Lorg/djvu/VDPage;

    invoke-virtual {v1, v2}, Lorg/djvu/VDPage;->GetVY(F)I

    move-result v1

    iget-object v2, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v2}, Lorg/djvu/DLayout;->vGetY()I

    move-result v2

    sub-int/2addr v1, v2

    .line 469
    iget-object v2, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v2}, Lorg/djvu/DLayout;->vGetScale()F

    move-result v2

    .line 470
    iget-object v3, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    invoke-virtual {v3, p1, v2, v0, v1}, Lorg/djvu/VDSel;->DrawSel(Landroid/graphics/Canvas;FII)V

    :cond_4
    return-void
.end method

.method private onTouchNone(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 239
    iget v0, p0, Lorg/djvu/DLayoutView;->m_status:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 240
    :cond_0
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_gesture:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    return v2

    .line 241
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_b

    if-eq v0, v2, :cond_7

    const/4 v3, 0x2

    if-eq v0, v3, :cond_3

    const/4 v4, 0x3

    if-eq v0, v4, :cond_7

    const/4 v4, 0x5

    if-eq v0, v4, :cond_2

    goto/16 :goto_2

    .line 283
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-lt v0, v3, :cond_c

    .line 284
    iput v2, p0, Lorg/djvu/DLayoutView;->m_status:I

    .line 285
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    add-float/2addr v0, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v0, v3

    iput v0, p0, Lorg/djvu/DLayoutView;->m_hold_x:F

    .line 286
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    add-float/2addr v0, v4

    div-float/2addr v0, v3

    iput v0, p0, Lorg/djvu/DLayoutView;->m_hold_y:F

    .line 287
    iget-object v3, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v4, p0, Lorg/djvu/DLayoutView;->m_hold_x:F

    float-to-int v4, v4

    float-to-int v0, v0

    invoke-virtual {v3, v4, v0}, Lorg/djvu/DLayout;->vGetPos(II)Lorg/djvu/DLayout$DjvuPos;

    move-result-object v0

    iput-object v0, p0, Lorg/djvu/DLayoutView;->m_zoom_pos:Lorg/djvu/DLayout$DjvuPos;

    .line 288
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 289
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v1, p1

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    float-to-double v0, v0

    .line 290
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    iput p1, p0, Lorg/djvu/DLayoutView;->m_zoom_dis0:F

    .line 291
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vGetZoom()F

    move-result p1

    iput p1, p0, Lorg/djvu/DLayoutView;->m_zoom_scale:F

    .line 292
    iput v2, p0, Lorg/djvu/DLayoutView;->m_status:I

    .line 293
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vZoomStart()V

    .line 294
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_listener:Lorg/djvu/IDLayoutView$DjvuLayoutListener;

    if-eqz p1, :cond_c

    .line 295
    invoke-interface {p1}, Lorg/djvu/IDLayoutView$DjvuLayoutListener;->OnDjvuZoomStart()V

    goto/16 :goto_2

    .line 252
    :cond_3
    iget-boolean v0, p0, Lorg/djvu/DLayoutView;->m_hold:Z

    if-eqz v0, :cond_c

    .line 253
    iget-boolean v0, p0, Lorg/djvu/DLayoutView;->scoll_lock:Z

    if-eqz v0, :cond_5

    .line 254
    sget v0, Lorg/djvu/DLayoutView;->def_view:I

    if-nez v0, :cond_4

    .line 255
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v1, p0, Lorg/djvu/DLayoutView;->m_hold_docy:I

    int-to-float v1, v1

    iget v3, p0, Lorg/djvu/DLayoutView;->m_hold_y:F

    add-float/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v1, p1

    float-to-int p1, v1

    invoke-virtual {v0, p1}, Lorg/djvu/DLayout;->vSetY(I)V

    goto :goto_0

    :cond_4
    if-ne v0, v2, :cond_6

    .line 257
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v1, p0, Lorg/djvu/DLayoutView;->m_hold_docx:I

    int-to-float v1, v1

    iget v3, p0, Lorg/djvu/DLayoutView;->m_hold_x:F

    add-float/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    sub-float/2addr v1, p1

    float-to-int p1, v1

    invoke-virtual {v0, p1}, Lorg/djvu/DLayout;->vSetX(I)V

    goto :goto_0

    .line 259
    :cond_5
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v1, p0, Lorg/djvu/DLayoutView;->m_hold_docx:I

    int-to-float v1, v1

    iget v3, p0, Lorg/djvu/DLayoutView;->m_hold_x:F

    add-float/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    sub-float/2addr v1, v3

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Lorg/djvu/DLayout;->vSetX(I)V

    .line 260
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v1, p0, Lorg/djvu/DLayoutView;->m_hold_docy:I

    int-to-float v1, v1

    iget v3, p0, Lorg/djvu/DLayoutView;->m_hold_y:F

    add-float/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v1, p1

    float-to-int p1, v1

    invoke-virtual {v0, p1}, Lorg/djvu/DLayout;->vSetY(I)V

    .line 262
    :cond_6
    :goto_0
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    goto/16 :goto_2

    .line 267
    :cond_7
    iget-boolean v0, p0, Lorg/djvu/DLayoutView;->m_hold:Z

    if-eqz v0, :cond_c

    .line 268
    iget-boolean v0, p0, Lorg/djvu/DLayoutView;->scoll_lock:Z

    if-eqz v0, :cond_9

    .line 269
    sget v0, Lorg/djvu/DLayoutView;->def_view:I

    if-nez v0, :cond_8

    .line 270
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v3, p0, Lorg/djvu/DLayoutView;->m_hold_docy:I

    int-to-float v3, v3

    iget v4, p0, Lorg/djvu/DLayoutView;->m_hold_y:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v3, p1

    float-to-int p1, v3

    invoke-virtual {v0, p1}, Lorg/djvu/DLayout;->vSetY(I)V

    goto :goto_1

    :cond_8
    if-ne v0, v2, :cond_a

    .line 272
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v3, p0, Lorg/djvu/DLayoutView;->m_hold_docx:I

    int-to-float v3, v3

    iget v4, p0, Lorg/djvu/DLayoutView;->m_hold_x:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    sub-float/2addr v3, p1

    float-to-int p1, v3

    invoke-virtual {v0, p1}, Lorg/djvu/DLayout;->vSetX(I)V

    goto :goto_1

    .line 274
    :cond_9
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v3, p0, Lorg/djvu/DLayoutView;->m_hold_docx:I

    int-to-float v3, v3

    iget v4, p0, Lorg/djvu/DLayoutView;->m_hold_x:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    sub-float/2addr v3, v4

    float-to-int v3, v3

    invoke-virtual {v0, v3}, Lorg/djvu/DLayout;->vSetX(I)V

    .line 275
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v3, p0, Lorg/djvu/DLayoutView;->m_hold_docy:I

    int-to-float v3, v3

    iget v4, p0, Lorg/djvu/DLayoutView;->m_hold_y:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v3, p1

    float-to-int p1, v3

    invoke-virtual {v0, p1}, Lorg/djvu/DLayout;->vSetY(I)V

    .line 277
    :cond_a
    :goto_1
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    .line 278
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vMoveEnd()V

    .line 279
    iput-boolean v1, p0, Lorg/djvu/DLayoutView;->m_hold:Z

    goto :goto_2

    .line 243
    :cond_b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lorg/djvu/DLayoutView;->m_hold_x:F

    .line 244
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lorg/djvu/DLayoutView;->m_hold_y:F

    .line 245
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vGetX()I

    move-result p1

    iput p1, p0, Lorg/djvu/DLayoutView;->m_hold_docx:I

    .line 246
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vGetY()I

    move-result p1

    iput p1, p0, Lorg/djvu/DLayoutView;->m_hold_docy:I

    .line 247
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vScrollAbort()V

    .line 248
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    .line 249
    iput-boolean v2, p0, Lorg/djvu/DLayoutView;->m_hold:Z

    :cond_c
    :goto_2
    return v2
.end method

.method private onTouchSelect(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 344
    iget p1, p0, Lorg/djvu/DLayoutView;->m_status:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private onTouchZoom(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 303
    iget v0, p0, Lorg/djvu/DLayoutView;->m_status:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    return v1

    .line 304
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

    .line 306
    :cond_1
    iget v0, p0, Lorg/djvu/DLayoutView;->m_status:I

    if-ne v0, v2, :cond_4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-lt v0, v3, :cond_4

    .line 307
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 308
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v1, p1

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    float-to-double v0, v0

    .line 309
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    .line 310
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v1, p0, Lorg/djvu/DLayoutView;->m_hold_x:F

    float-to-int v1, v1

    iget v3, p0, Lorg/djvu/DLayoutView;->m_hold_y:F

    float-to-int v3, v3

    iget-object v4, p0, Lorg/djvu/DLayoutView;->m_zoom_pos:Lorg/djvu/DLayout$DjvuPos;

    iget v5, p0, Lorg/djvu/DLayoutView;->m_zoom_scale:F

    mul-float v5, v5, p1

    iget p1, p0, Lorg/djvu/DLayoutView;->m_zoom_dis0:F

    div-float/2addr v5, p1

    invoke-virtual {v0, v1, v3, v4, v5}, Lorg/djvu/DLayout;->vZoomSet(IILorg/djvu/DLayout$DjvuPos;F)V

    .line 311
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    goto :goto_0

    .line 317
    :cond_2
    iget v0, p0, Lorg/djvu/DLayoutView;->m_status:I

    if-ne v0, v2, :cond_4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ne v0, v3, :cond_4

    .line 318
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 319
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v3, p1

    mul-float v0, v0, v0

    mul-float v3, v3, v3

    add-float/2addr v0, v3

    float-to-double v3, v0

    .line 320
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    double-to-float p1, v3

    .line 321
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v3, p0, Lorg/djvu/DLayoutView;->m_hold_x:F

    float-to-int v3, v3

    iget v4, p0, Lorg/djvu/DLayoutView;->m_hold_y:F

    float-to-int v4, v4

    iget-object v5, p0, Lorg/djvu/DLayoutView;->m_zoom_pos:Lorg/djvu/DLayout$DjvuPos;

    iget v6, p0, Lorg/djvu/DLayoutView;->m_zoom_scale:F

    mul-float v6, v6, p1

    iget p1, p0, Lorg/djvu/DLayoutView;->m_zoom_dis0:F

    div-float/2addr v6, p1

    invoke-virtual {v0, v3, v4, v5, v6}, Lorg/djvu/DLayout;->vZoomSet(IILorg/djvu/DLayout$DjvuPos;F)V

    const p1, -0x39e3c000    # -10000.0f

    .line 322
    iput p1, p0, Lorg/djvu/DLayoutView;->m_hold_x:F

    .line 323
    iput p1, p0, Lorg/djvu/DLayoutView;->m_hold_y:F

    .line 324
    iput v1, p0, Lorg/djvu/DLayoutView;->m_status:I

    .line 325
    iget p1, p0, Lorg/djvu/DLayoutView;->m_zoom_scale:F

    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v0}, Lorg/djvu/DLayout;->vGetZoom()F

    move-result v0

    cmpg-float p1, p1, v0

    if-gez p1, :cond_3

    .line 326
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    .line 327
    :cond_3
    iput-boolean v1, p0, Lorg/djvu/DLayoutView;->m_hold:Z

    .line 328
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_listener:Lorg/djvu/IDLayoutView$DjvuLayoutListener;

    if-eqz p1, :cond_4

    .line 329
    invoke-interface {p1}, Lorg/djvu/IDLayoutView$DjvuLayoutListener;->OnDjvuZoomEnd()V

    :cond_4
    :goto_0
    return v2
.end method


# virtual methods
.method public DjvuClose()V
    .locals 1

    .line 563
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    if-eqz v0, :cond_0

    .line 564
    invoke-virtual {v0}, Lorg/djvu/DDocument;->Close()V

    .line 566
    :cond_0
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-eqz v0, :cond_1

    .line 567
    invoke-virtual {v0}, Lorg/djvu/DLayout;->vClose()V

    const/4 v0, 0x0

    .line 568
    iput-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    const/4 v0, 0x0

    .line 569
    iput v0, p0, Lorg/djvu/DLayoutView;->m_status:I

    const/4 v0, -0x1

    .line 570
    iput v0, p0, Lorg/djvu/DLayoutView;->m_pageno:I

    :cond_1
    return-void
.end method

.method public final DjvuGetCurrPage()I
    .locals 1

    .line 614
    iget v0, p0, Lorg/djvu/DLayoutView;->m_pageno:I

    return v0
.end method

.method public DjvuGetMinScale()F
    .locals 1

    .line 608
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-eqz v0, :cond_0

    .line 609
    invoke-virtual {v0}, Lorg/djvu/DLayout;->vGetMinScale()F

    move-result v0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public final DjvuGetPos(II)Lorg/djvu/DLayout$DjvuPos;
    .locals 1

    .line 589
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-eqz v0, :cond_0

    .line 590
    invoke-virtual {v0, p1, p2}, Lorg/djvu/DLayout;->vGetPos(II)Lorg/djvu/DLayout$DjvuPos;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public DjvuGetScale()F
    .locals 1

    .line 602
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-eqz v0, :cond_0

    .line 603
    invoke-virtual {v0}, Lorg/djvu/DLayout;->vGetScale()F

    move-result v0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public DjvuGotoPage(I)V
    .locals 2

    .line 540
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-nez v0, :cond_0

    return-void

    .line 541
    :cond_0
    invoke-virtual {v0}, Lorg/djvu/DLayout;->vGetHeight()I

    move-result v0

    if-lez v0, :cond_2

    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v0}, Lorg/djvu/DLayout;->vGetWidth()I

    move-result v0

    if-gtz v0, :cond_1

    goto :goto_0

    .line 547
    :cond_1
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v0, p1}, Lorg/djvu/DLayout;->vGotoPage(I)V

    .line 548
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    return-void

    .line 542
    :cond_2
    :goto_0
    new-instance v0, Lorg/djvu/DLayout$DjvuPos;

    invoke-direct {v0}, Lorg/djvu/DLayout$DjvuPos;-><init>()V

    iput-object v0, p0, Lorg/djvu/DLayoutView;->m_goto_pos:Lorg/djvu/DLayout$DjvuPos;

    .line 543
    iput p1, v0, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    .line 544
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_goto_pos:Lorg/djvu/DLayout$DjvuPos;

    const/4 v1, 0x0

    iput v1, v0, Lorg/djvu/DLayout$DjvuPos;->x:F

    .line 545
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_goto_pos:Lorg/djvu/DLayout$DjvuPos;

    iget-object v1, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v1, p1}, Lorg/djvu/DDocument;->GetPageHeight(I)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    int-to-float p1, p1

    iput p1, v0, Lorg/djvu/DLayout$DjvuPos;->y:F

    return-void
.end method

.method public DjvuOpen(Lorg/djvu/DDocument;ILorg/djvu/IDLayoutView$DjvuLayoutListener;)V
    .locals 4

    .line 59
    iput-object p1, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    .line 60
    iput-object p3, p0, Lorg/djvu/DLayoutView;->m_listener:Lorg/djvu/IDLayoutView$DjvuLayoutListener;

    if-lez p2, :cond_4

    .line 62
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getWidth()I

    move-result p1

    if-lez p1, :cond_0

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getWidth()I

    move-result p1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 63
    :goto_0
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getHeight()I

    move-result p2

    if-lez p2, :cond_1

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getHeight()I

    move-result p2

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->heightPixels:I

    :goto_1
    const/4 p3, 0x1

    const/4 v0, 0x3

    if-le p1, p2, :cond_2

    const/4 v1, 0x1

    goto :goto_2

    :cond_2
    const/4 v1, 0x3

    :goto_2
    if-ne v1, v0, :cond_3

    .line 66
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v0

    iget v0, v0, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    int-to-float v0, v0

    .line 67
    iget-object v3, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v3, v2}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v2

    iget v2, v2, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    int-to-float v2, v2

    int-to-float p1, p1

    mul-float p1, p1, v2

    div-float/2addr p1, v0

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_3

    const/4 p2, 0x1

    goto :goto_3

    :cond_3
    move p2, v1

    .line 72
    :cond_4
    :goto_3
    invoke-virtual {p0, p2}, Lorg/djvu/DLayoutView;->DjvuSetView(I)V

    return-void
.end method

.method public final DjvuSetPos(Lorg/djvu/DLayout$DjvuPos;II)V
    .locals 1

    .line 595
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-eqz v0, :cond_0

    .line 596
    invoke-virtual {v0, p2, p3, p1}, Lorg/djvu/DLayout;->vSetPos(IILorg/djvu/DLayout$DjvuPos;)V

    .line 597
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    :cond_0
    return-void
.end method

.method public DjvuSetView(I)V
    .locals 7

    .line 77
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 78
    invoke-virtual {v0, v1, v1}, Lorg/djvu/DLayout;->vGetPos(II)Lorg/djvu/DLayout$DjvuPos;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v2

    :goto_0
    const/4 v3, 0x1

    const/4 v4, 0x3

    if-eq p1, v3, :cond_2

    if-eq p1, v4, :cond_1

    .line 89
    new-instance v3, Lorg/djvu/DLayoutVert;

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/djvu/DLayoutVert;-><init>(Landroid/content/Context;)V

    .line 90
    iput-object v3, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    goto :goto_1

    .line 84
    :cond_1
    new-instance v3, Lorg/djvu/DLayoutSingle;

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/djvu/DLayoutSingle;-><init>(Landroid/content/Context;)V

    .line 85
    iput-object v3, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    goto :goto_1

    .line 81
    :cond_2
    new-instance v3, Lorg/djvu/DLayoutHorz;

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/djvu/DLayoutHorz;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    .line 94
    :goto_1
    iget-object v3, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    sput p1, Lorg/djvu/DLayoutView;->def_view:I

    iput p1, v3, Lorg/djvu/DLayout;->def_view:I

    .line 96
    iget-object v3, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget-object v5, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v3, v5, p0}, Lorg/djvu/DLayout;->vOpen(Lorg/djvu/DDocument;Lorg/djvu/DLayout$LayoutListener;)V

    .line 97
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getWidth()I

    move-result v3

    if-lez v3, :cond_6

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getHeight()I

    move-result v3

    if-lez v3, :cond_6

    .line 98
    iget-object v3, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getWidth()I

    move-result v5

    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getHeight()I

    move-result v6

    invoke-virtual {v3, v5, v6}, Lorg/djvu/DLayout;->vResize(II)V

    .line 99
    iget-object v3, p0, Lorg/djvu/DLayoutView;->m_goto_pos:Lorg/djvu/DLayout$DjvuPos;

    if-eqz v3, :cond_3

    .line 100
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p1, v1, v1, v3}, Lorg/djvu/DLayout;->vSetPos(IILorg/djvu/DLayout$DjvuPos;)V

    .line 101
    iput-object v2, p0, Lorg/djvu/DLayoutView;->m_goto_pos:Lorg/djvu/DLayout$DjvuPos;

    .line 102
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    goto :goto_3

    :cond_3
    if-eqz v0, :cond_6

    if-eq p1, v4, :cond_5

    const/4 v2, 0x4

    if-eq p1, v2, :cond_5

    const/4 v2, 0x6

    if-ne p1, v2, :cond_4

    goto :goto_2

    .line 107
    :cond_4
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p1, v1, v1, v0}, Lorg/djvu/DLayout;->vSetPos(IILorg/djvu/DLayout$DjvuPos;)V

    goto :goto_3

    .line 105
    :cond_5
    :goto_2
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v0, v0, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    invoke-virtual {p1, v0}, Lorg/djvu/DLayout;->vGotoPage(I)V

    .line 111
    :cond_6
    :goto_3
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    return-void
.end method

.method public final GetDoc()Lorg/djvu/DDocument;
    .locals 1

    .line 577
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    return-object v0
.end method

.method public GetZoom()F
    .locals 1

    .line 585
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/djvu/DLayout;->vGetZoom()F

    move-result v0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public OnPageChanged(I)V
    .locals 1

    .line 556
    iput p1, p0, Lorg/djvu/DLayoutView;->m_pageno:I

    .line 557
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_listener:Lorg/djvu/IDLayoutView$DjvuLayoutListener;

    if-eqz v0, :cond_0

    .line 558
    invoke-interface {v0, p1}, Lorg/djvu/IDLayoutView$DjvuLayoutListener;->OnDjvuPageChanged(I)V

    :cond_0
    return-void
.end method

.method public SetZoom(IILorg/djvu/DLayout$DjvuPos;F)V
    .locals 1

    .line 581
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/djvu/DLayout;->vZoomSet(IILorg/djvu/DLayout$DjvuPos;F)V

    :cond_0
    return-void
.end method

.method public computeScroll()V
    .locals 1

    .line 203
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/djvu/DLayout;->vScrollCompute()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    :cond_0
    return-void
.end method

.method public delForceSel(Z)V
    .locals 3

    .line 486
    iget v0, p0, Lorg/djvu/DLayoutView;->force_sel_start:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 487
    :goto_0
    iput v2, p0, Lorg/djvu/DLayoutView;->force_sel_end:I

    iput v2, p0, Lorg/djvu/DLayoutView;->force_sel_start:I

    .line 488
    iput v1, p0, Lorg/djvu/DLayoutView;->m_status:I

    const/4 v1, 0x0

    .line 489
    iput-object v1, p0, Lorg/djvu/DLayoutView;->tts_annot_page:Lorg/djvu/VDPage;

    .line 490
    iput-object v1, p0, Lorg/djvu/DLayoutView;->ttsPara:Landroid/graphics/RectF;

    .line 491
    iget-object v2, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    if-eqz v2, :cond_1

    .line 492
    invoke-virtual {v2}, Lorg/djvu/VDSel;->Clear()V

    .line 493
    iput-object v1, p0, Lorg/djvu/DLayoutView;->tts_sel:Lorg/djvu/VDSel;

    :cond_1
    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    .line 496
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    :cond_2
    return-void
.end method

.method public doTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 115
    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 116
    :cond_0
    invoke-direct {p0, p1}, Lorg/djvu/DLayoutView;->onTouchNone(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    return v1

    .line 117
    :cond_1
    invoke-direct {p0, p1}, Lorg/djvu/DLayoutView;->onTouchZoom(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    .line 118
    :cond_2
    invoke-direct {p0, p1}, Lorg/djvu/DLayoutView;->onTouchSelect(Landroid/view/MotionEvent;)Z

    return v1
.end method

.method public formateSize(J)Ljava/lang/String;
    .locals 1

    .line 198
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMemoryInfo()Ljava/lang/String;
    .locals 8

    .line 189
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    .line 190
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v2

    .line 191
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v4

    .line 192
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "max:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lorg/djvu/DLayoutView;->formateSize(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " free:"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    invoke-virtual {p0, v4, v5}, Lorg/djvu/DLayoutView;->formateSize(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "|take:"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sub-long/2addr v2, v4

    invoke-virtual {p0, v2, v3}, Lorg/djvu/DLayoutView;->formateSize(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 127
    sget-boolean v0, Lcom/radaee/pdf/Global;->textReflow:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 129
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

    .line 130
    sget v0, Lcom/radaee/pdf/Global;->pdf_theme:I

    if-le v0, v1, :cond_3

    .line 132
    :try_start_0
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getWidth()I

    move-result v0

    .line 133
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->getHeight()I

    move-result v1

    .line 134
    iget-object v3, p0, Lorg/djvu/DLayoutView;->themeCanvas:Landroid/graphics/Canvas;

    if-nez v3, :cond_2

    .line 135
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lorg/djvu/DLayoutView;->themeBitmap:Landroid/graphics/Bitmap;

    .line 136
    new-instance v3, Landroid/graphics/Canvas;

    iget-object v4, p0, Lorg/djvu/DLayoutView;->themeBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v3, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v3, p0, Lorg/djvu/DLayoutView;->themeCanvas:Landroid/graphics/Canvas;

    .line 138
    :cond_2
    iget-object v3, p0, Lorg/djvu/DLayoutView;->themeCanvas:Landroid/graphics/Canvas;

    invoke-direct {p0, v3}, Lorg/djvu/DLayoutView;->doOnDraw(Landroid/graphics/Canvas;)V

    .line 139
    new-instance v3, Landroid/graphics/ColorMatrix;

    invoke-direct {v3}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 140
    sget v4, Lcom/radaee/pdf/Global;->pdf_theme:I

    invoke-static {v4}, Lcom/radaee/pdf/Global;->getThemeArray(I)[F

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/ColorMatrix;->set([F)V

    .line 141
    new-instance v4, Landroid/graphics/ColorMatrixColorFilter;

    invoke-direct {v4, v3}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 142
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 143
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 144
    iget-object v4, p0, Lorg/djvu/DLayoutView;->themeBitmap:Landroid/graphics/Bitmap;

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

    .line 150
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 151
    invoke-direct {p0, p1}, Lorg/djvu/DLayoutView;->doOnDraw(Landroid/graphics/Canvas;)V

    goto :goto_1

    :catch_1
    move-exception v0

    .line 147
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 148
    invoke-direct {p0, p1}, Lorg/djvu/DLayoutView;->doOnDraw(Landroid/graphics/Canvas;)V

    :goto_1
    return-void

    .line 154
    :cond_3
    invoke-direct {p0, p1}, Lorg/djvu/DLayoutView;->doOnDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 1

    .line 209
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    if-eq p1, p3, :cond_2

    if-ne p2, p4, :cond_0

    goto :goto_0

    .line 212
    :cond_0
    iget-object p3, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-eqz p3, :cond_2

    if-lez p1, :cond_2

    if-lez p2, :cond_2

    .line 213
    invoke-virtual {p3, p1, p2}, Lorg/djvu/DLayout;->vResize(II)V

    .line 215
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_goto_pos:Lorg/djvu/DLayout$DjvuPos;

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    .line 216
    iget p1, p1, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    iput p1, p0, Lorg/djvu/DLayoutView;->m_pageno:I

    .line 217
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget-object p3, p0, Lorg/djvu/DLayoutView;->m_goto_pos:Lorg/djvu/DLayout$DjvuPos;

    invoke-virtual {p1, p2, p2, p3}, Lorg/djvu/DLayout;->vSetPos(IILorg/djvu/DLayout$DjvuPos;)V

    const/4 p1, 0x0

    .line 218
    iput-object p1, p0, Lorg/djvu/DLayoutView;->m_goto_pos:Lorg/djvu/DLayout$DjvuPos;

    .line 219
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    .line 222
    :cond_1
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vGetWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    iget-object p4, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p4}, Lorg/djvu/DLayout;->vGetHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v0, p2, p2}, Lorg/djvu/DLayout;->vGetPos(II)Lorg/djvu/DLayout$DjvuPos;

    move-result-object p2

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, p3, p4, p2, v0}, Lorg/djvu/DLayout;->vZoomSet(IILorg/djvu/DLayout$DjvuPos;F)V

    .line 223
    iget p1, p0, Lorg/djvu/DLayoutView;->m_pageno:I

    invoke-virtual {p0, p1}, Lorg/djvu/DLayoutView;->DjvuGotoPage(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public setForceSel(II)V
    .locals 0

    .line 480
    iput p1, p0, Lorg/djvu/DLayoutView;->force_sel_start:I

    .line 481
    iput p2, p0, Lorg/djvu/DLayoutView;->force_sel_end:I

    .line 482
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->postInvalidate()V

    return-void
.end method

.method public zSetSelect(ZZIIIILorg/djvu/DLayoutView$OnAfterSelect;)V
    .locals 8

    .line 507
    iget v0, p0, Lorg/djvu/DLayoutView;->force_sel_start:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    .line 508
    invoke-virtual {p0, v0}, Lorg/djvu/DLayoutView;->delForceSel(Z)V

    :cond_0
    const/4 v0, 0x2

    .line 510
    iput v0, p0, Lorg/djvu/DLayoutView;->m_status:I

    int-to-float p3, p3

    .line 511
    iput p3, p0, Lorg/djvu/DLayoutView;->m_hold_x:F

    int-to-float p3, p4

    .line 512
    iput p3, p0, Lorg/djvu/DLayoutView;->m_hold_y:F

    .line 513
    iget-object p3, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    if-eqz p3, :cond_1

    if-eqz p1, :cond_3

    :cond_1
    if-eqz p3, :cond_2

    .line 515
    invoke-virtual {p3}, Lorg/djvu/VDSel;->Clear()V

    const/4 p1, 0x0

    .line 516
    iput-object p1, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    .line 518
    :cond_2
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget p3, p0, Lorg/djvu/DLayoutView;->m_hold_x:F

    float-to-int p3, p3

    iget p4, p0, Lorg/djvu/DLayoutView;->m_hold_y:F

    float-to-int p4, p4

    invoke-virtual {p1, p3, p4}, Lorg/djvu/DLayout;->vGetPos(II)Lorg/djvu/DLayout$DjvuPos;

    move-result-object p1

    iput-object p1, p0, Lorg/djvu/DLayoutView;->m_annot_pos:Lorg/djvu/DLayout$DjvuPos;

    .line 519
    iget-object p3, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget p1, p1, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    invoke-virtual {p3, p1}, Lorg/djvu/DLayout;->vGetPage(I)Lorg/djvu/VDPage;

    move-result-object p1

    iput-object p1, p0, Lorg/djvu/DLayoutView;->m_annot_page:Lorg/djvu/VDPage;

    .line 520
    new-instance p1, Lorg/djvu/VDSel;

    iget-object p3, p0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    iget-object p4, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget-object v0, p0, Lorg/djvu/DLayoutView;->m_annot_pos:Lorg/djvu/DLayout$DjvuPos;

    iget v0, v0, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    iget-object v1, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget v1, v1, Lorg/djvu/DLayout;->m_scale:F

    invoke-direct {p1, p3, p4, v0, v1}, Lorg/djvu/VDSel;-><init>(Lorg/djvu/DDocument;Lorg/djvu/DLayout;IF)V

    iput-object p1, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    .line 523
    :cond_3
    iget-object v2, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_annot_pos:Lorg/djvu/DLayout$DjvuPos;

    iget v3, p1, Lorg/djvu/DLayout$DjvuPos;->x:F

    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_annot_pos:Lorg/djvu/DLayout$DjvuPos;

    iget v4, p1, Lorg/djvu/DLayout$DjvuPos;->y:F

    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_annot_page:Lorg/djvu/VDPage;

    iget-object p3, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    .line 524
    invoke-virtual {p3}, Lorg/djvu/DLayout;->vGetX()I

    move-result p3

    add-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p1, p3}, Lorg/djvu/VDPage;->GetDjvuX(F)F

    move-result v5

    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_annot_page:Lorg/djvu/VDPage;

    iget-object p3, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    .line 525
    invoke-virtual {p3}, Lorg/djvu/DLayout;->vGetY()I

    move-result p3

    add-int/2addr p6, p3

    int-to-float p3, p6

    invoke-virtual {p1, p3}, Lorg/djvu/VDPage;->GetDjvuY(F)F

    move-result v6

    move v7, p2

    .line 523
    invoke-virtual/range {v2 .. v7}, Lorg/djvu/VDSel;->SetSel(FFFFZ)V

    .line 526
    invoke-virtual {p0}, Lorg/djvu/DLayoutView;->invalidate()V

    .line 527
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_listener:Lorg/djvu/IDLayoutView$DjvuLayoutListener;

    if-eqz p1, :cond_4

    .line 528
    iget-object p2, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    invoke-virtual {p2}, Lorg/djvu/VDSel;->GetSelString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lorg/djvu/IDLayoutView$DjvuLayoutListener;->OnDjvuSelectEnd(Ljava/lang/String;)V

    :cond_4
    if-eqz p7, :cond_5

    .line 532
    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    invoke-virtual {p1}, Lorg/djvu/VDSel;->GetSelString()Ljava/lang/String;

    move-result-object p3

    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    iget p4, p1, Lorg/djvu/VDSel;->m_index1:I

    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    iget p5, p1, Lorg/djvu/VDSel;->m_index2:I

    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    iget-object p2, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    .line 534
    invoke-virtual {p1, p2}, Lorg/djvu/VDSel;->GetVRect1(Lorg/djvu/DLayout;)[I

    move-result-object p6

    iget-object p1, p0, Lorg/djvu/DLayoutView;->m_sel:Lorg/djvu/VDSel;

    iget-object p2, p0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    .line 535
    invoke-virtual {p1, p2}, Lorg/djvu/VDSel;->GetVRect2(Lorg/djvu/DLayout;)[I

    move-result-object p1

    move-object p2, p7

    move-object p7, p1

    .line 532
    invoke-interface/range {p2 .. p7}, Lorg/djvu/DLayoutView$OnAfterSelect;->onAfterSelect(Ljava/lang/String;II[I[I)V

    :cond_5
    return-void
.end method
