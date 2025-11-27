.class public Lorg/comic/CLayoutView;
.super Landroid/view/View;
.source "CLayoutView.java"

# interfaces
.implements Lorg/comic/ICLayoutView;
.implements Lorg/comic/CLayout$LayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/comic/CLayoutView$CGestureListener;
    }
.end annotation


# instance fields
.field public def_view:I

.field public m_doc:Lorg/comic/CDocument;

.field public m_gesture:Landroid/view/GestureDetector;

.field public m_goto_pos:Lorg/comic/CLayout$Pos;

.field public m_hold:Z

.field private m_hold_docx:I

.field private m_hold_docy:I

.field private m_hold_x:F

.field private m_hold_y:F

.field public m_info_paint:Landroid/graphics/Paint;

.field public m_layout:Lorg/comic/CLayout;

.field public m_listener:Lorg/comic/ICLayoutView$CLayoutListener;

.field public m_pageno:I

.field public m_status:I

.field private m_zoom_dis0:F

.field private m_zoom_pos:Lorg/comic/CLayout$Pos;

.field private m_zoom_scale:F

.field public scoll_lock:Z

.field themeBitmap:Landroid/graphics/Bitmap;

.field themeCanvas:Landroid/graphics/Canvas;


# direct methods
.method static bridge synthetic -$$Nest$fgetm_hold_docx(Lorg/comic/CLayoutView;)I
    .locals 0

    iget p0, p0, Lorg/comic/CLayoutView;->m_hold_docx:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetm_hold_docy(Lorg/comic/CLayoutView;)I
    .locals 0

    iget p0, p0, Lorg/comic/CLayoutView;->m_hold_docy:I

    return p0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 36
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lorg/comic/CLayoutView;->def_view:I

    .line 25
    iput-boolean v0, p0, Lorg/comic/CLayoutView;->scoll_lock:Z

    .line 28
    iput v0, p0, Lorg/comic/CLayoutView;->m_status:I

    .line 29
    iput v0, p0, Lorg/comic/CLayoutView;->m_pageno:I

    const/4 v1, 0x0

    .line 30
    iput-object v1, p0, Lorg/comic/CLayoutView;->m_goto_pos:Lorg/comic/CLayout$Pos;

    .line 220
    iput-boolean v0, p0, Lorg/comic/CLayoutView;->m_hold:Z

    .line 37
    iput-object v1, p0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    .line 38
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lorg/comic/CLayoutView$CGestureListener;

    invoke-direct {v1, p0}, Lorg/comic/CLayoutView$CGestureListener;-><init>(Lorg/comic/CLayoutView;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lorg/comic/CLayoutView;->m_gesture:Landroid/view/GestureDetector;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 43
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 23
    iput p2, p0, Lorg/comic/CLayoutView;->def_view:I

    .line 25
    iput-boolean p2, p0, Lorg/comic/CLayoutView;->scoll_lock:Z

    .line 28
    iput p2, p0, Lorg/comic/CLayoutView;->m_status:I

    .line 29
    iput p2, p0, Lorg/comic/CLayoutView;->m_pageno:I

    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Lorg/comic/CLayoutView;->m_goto_pos:Lorg/comic/CLayout$Pos;

    .line 220
    iput-boolean p2, p0, Lorg/comic/CLayoutView;->m_hold:Z

    .line 44
    iput-object v0, p0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    .line 45
    new-instance p2, Landroid/view/GestureDetector;

    new-instance v0, Lorg/comic/CLayoutView$CGestureListener;

    invoke-direct {v0, p0}, Lorg/comic/CLayoutView$CGestureListener;-><init>(Lorg/comic/CLayoutView;)V

    invoke-direct {p2, p1, v0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p2, p0, Lorg/comic/CLayoutView;->m_gesture:Landroid/view/GestureDetector;

    return-void
.end method

.method private doOnDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 146
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-eqz v0, :cond_1

    .line 148
    :try_start_0
    iget v0, v0, Lorg/comic/CLayout;->m_back_color:I

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 149
    iget-object v1, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v0, p0, Lorg/comic/CLayoutView;->m_status:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    const/4 v4, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getWidth()I

    move-result v5

    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getHeight()I

    move-result v6
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, p0

    move-object v3, p1

    :try_start_1
    invoke-virtual/range {v1 .. v6}, Lorg/comic/CLayout;->vDraw(Landroid/view/View;Landroid/graphics/Canvas;ZII)V
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_0
    :cond_1
    move-object v3, p1

    .line 154
    :catch_1
    :goto_1
    invoke-direct {p0, v3}, Lorg/comic/CLayoutView;->drawDebug(Landroid/graphics/Canvas;)V

    return-void
.end method

.method private drawDebug(Landroid/graphics/Canvas;)V
    .locals 5

    .line 158
    sget-boolean v0, Lcom/radaee/pdf/Global;->debug_mode:Z

    if-eqz v0, :cond_0

    .line 160
    :try_start_0
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getMemoryInfo()Ljava/lang/String;

    move-result-object v0

    .line 161
    iget-object v1, p0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual {v1, v2}, Lorg/comic/CDocument;->d(F)I

    move-result v1

    int-to-float v1, v1

    iget-object v3, p0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    const/high16 v4, 0x42a00000    # 80.0f

    invoke-virtual {v3, v4}, Lorg/comic/CDocument;->d(F)I

    move-result v3

    int-to-float v3, v3

    invoke-direct {p0}, Lorg/comic/CLayoutView;->getInfoPaint()Landroid/graphics/Paint;

    move-result-object v4

    invoke-virtual {p1, v0, v1, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lorg/comic/CLayoutView;->m_pageno:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v1}, Lorg/comic/CDocument;->GetPageCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    const/high16 v3, 0x42dc0000    # 110.0f

    invoke-virtual {v1, v3}, Lorg/comic/CDocument;->d(F)I

    move-result v1

    int-to-float v1, v1

    invoke-direct {p0}, Lorg/comic/CLayoutView;->getInfoPaint()Landroid/graphics/Paint;

    move-result-object v3

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 165
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    return-void
.end method

.method private getInfoPaint()Landroid/graphics/Paint;
    .locals 3

    .line 171
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_info_paint:Landroid/graphics/Paint;

    if-nez v0, :cond_0

    .line 172
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/comic/CLayoutView;->m_info_paint:Landroid/graphics/Paint;

    const/high16 v1, -0x10000

    .line 173
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 174
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_info_paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x41700000    # 15.0f

    mul-float v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 176
    :cond_0
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_info_paint:Landroid/graphics/Paint;

    return-object v0
.end method

.method private onTouchNone(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 230
    iget v0, p0, Lorg/comic/CLayoutView;->m_status:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 231
    :cond_0
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_gesture:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    return v2

    .line 232
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

    .line 274
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-lt v0, v3, :cond_c

    .line 275
    iput v2, p0, Lorg/comic/CLayoutView;->m_status:I

    .line 276
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    add-float/2addr v0, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v0, v3

    iput v0, p0, Lorg/comic/CLayoutView;->m_hold_x:F

    .line 277
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    add-float/2addr v0, v4

    div-float/2addr v0, v3

    iput v0, p0, Lorg/comic/CLayoutView;->m_hold_y:F

    .line 278
    iget-object v3, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v4, p0, Lorg/comic/CLayoutView;->m_hold_x:F

    float-to-int v4, v4

    float-to-int v0, v0

    invoke-virtual {v3, v4, v0}, Lorg/comic/CLayout;->vGetPos(II)Lorg/comic/CLayout$Pos;

    move-result-object v0

    iput-object v0, p0, Lorg/comic/CLayoutView;->m_zoom_pos:Lorg/comic/CLayout$Pos;

    .line 279
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 280
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v1, p1

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    float-to-double v0, v0

    .line 281
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    iput p1, p0, Lorg/comic/CLayoutView;->m_zoom_dis0:F

    .line 282
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p1}, Lorg/comic/CLayout;->vGetZoom()F

    move-result p1

    iput p1, p0, Lorg/comic/CLayoutView;->m_zoom_scale:F

    .line 283
    iput v2, p0, Lorg/comic/CLayoutView;->m_status:I

    .line 284
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p1}, Lorg/comic/CLayout;->vZoomStart()V

    .line 285
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_listener:Lorg/comic/ICLayoutView$CLayoutListener;

    if-eqz p1, :cond_c

    .line 286
    invoke-interface {p1}, Lorg/comic/ICLayoutView$CLayoutListener;->OnZoomStart()V

    goto/16 :goto_2

    .line 243
    :cond_3
    iget-boolean v0, p0, Lorg/comic/CLayoutView;->m_hold:Z

    if-eqz v0, :cond_c

    .line 244
    iget-boolean v0, p0, Lorg/comic/CLayoutView;->scoll_lock:Z

    if-eqz v0, :cond_5

    .line 245
    iget v0, p0, Lorg/comic/CLayoutView;->def_view:I

    if-nez v0, :cond_4

    .line 246
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v1, p0, Lorg/comic/CLayoutView;->m_hold_docy:I

    int-to-float v1, v1

    iget v3, p0, Lorg/comic/CLayoutView;->m_hold_y:F

    add-float/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v1, p1

    float-to-int p1, v1

    invoke-virtual {v0, p1}, Lorg/comic/CLayout;->vSetY(I)V

    goto :goto_0

    :cond_4
    if-ne v0, v2, :cond_6

    .line 248
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v1, p0, Lorg/comic/CLayoutView;->m_hold_docx:I

    int-to-float v1, v1

    iget v3, p0, Lorg/comic/CLayoutView;->m_hold_x:F

    add-float/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    sub-float/2addr v1, p1

    float-to-int p1, v1

    invoke-virtual {v0, p1}, Lorg/comic/CLayout;->vSetX(I)V

    goto :goto_0

    .line 250
    :cond_5
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v1, p0, Lorg/comic/CLayoutView;->m_hold_docx:I

    int-to-float v1, v1

    iget v3, p0, Lorg/comic/CLayoutView;->m_hold_x:F

    add-float/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    sub-float/2addr v1, v3

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Lorg/comic/CLayout;->vSetX(I)V

    .line 251
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v1, p0, Lorg/comic/CLayoutView;->m_hold_docy:I

    int-to-float v1, v1

    iget v3, p0, Lorg/comic/CLayoutView;->m_hold_y:F

    add-float/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v1, p1

    float-to-int p1, v1

    invoke-virtual {v0, p1}, Lorg/comic/CLayout;->vSetY(I)V

    .line 253
    :cond_6
    :goto_0
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->invalidate()V

    goto/16 :goto_2

    .line 258
    :cond_7
    iget-boolean v0, p0, Lorg/comic/CLayoutView;->m_hold:Z

    if-eqz v0, :cond_c

    .line 259
    iget-boolean v0, p0, Lorg/comic/CLayoutView;->scoll_lock:Z

    if-eqz v0, :cond_9

    .line 260
    iget v0, p0, Lorg/comic/CLayoutView;->def_view:I

    if-nez v0, :cond_8

    .line 261
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v3, p0, Lorg/comic/CLayoutView;->m_hold_docy:I

    int-to-float v3, v3

    iget v4, p0, Lorg/comic/CLayoutView;->m_hold_y:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v3, p1

    float-to-int p1, v3

    invoke-virtual {v0, p1}, Lorg/comic/CLayout;->vSetY(I)V

    goto :goto_1

    :cond_8
    if-ne v0, v2, :cond_a

    .line 263
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v3, p0, Lorg/comic/CLayoutView;->m_hold_docx:I

    int-to-float v3, v3

    iget v4, p0, Lorg/comic/CLayoutView;->m_hold_x:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    sub-float/2addr v3, p1

    float-to-int p1, v3

    invoke-virtual {v0, p1}, Lorg/comic/CLayout;->vSetX(I)V

    goto :goto_1

    .line 265
    :cond_9
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v3, p0, Lorg/comic/CLayoutView;->m_hold_docx:I

    int-to-float v3, v3

    iget v4, p0, Lorg/comic/CLayoutView;->m_hold_x:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    sub-float/2addr v3, v4

    float-to-int v3, v3

    invoke-virtual {v0, v3}, Lorg/comic/CLayout;->vSetX(I)V

    .line 266
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v3, p0, Lorg/comic/CLayoutView;->m_hold_docy:I

    int-to-float v3, v3

    iget v4, p0, Lorg/comic/CLayoutView;->m_hold_y:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v3, p1

    float-to-int p1, v3

    invoke-virtual {v0, p1}, Lorg/comic/CLayout;->vSetY(I)V

    .line 268
    :cond_a
    :goto_1
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->invalidate()V

    .line 269
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p1}, Lorg/comic/CLayout;->vMoveEnd()V

    .line 270
    iput-boolean v1, p0, Lorg/comic/CLayoutView;->m_hold:Z

    goto :goto_2

    .line 234
    :cond_b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lorg/comic/CLayoutView;->m_hold_x:F

    .line 235
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lorg/comic/CLayoutView;->m_hold_y:F

    .line 236
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p1}, Lorg/comic/CLayout;->vGetX()I

    move-result p1

    iput p1, p0, Lorg/comic/CLayoutView;->m_hold_docx:I

    .line 237
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p1}, Lorg/comic/CLayout;->vGetY()I

    move-result p1

    iput p1, p0, Lorg/comic/CLayoutView;->m_hold_docy:I

    .line 238
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p1}, Lorg/comic/CLayout;->vScrollAbort()V

    .line 239
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->invalidate()V

    .line 240
    iput-boolean v2, p0, Lorg/comic/CLayoutView;->m_hold:Z

    :cond_c
    :goto_2
    return v2
.end method

.method private onTouchZoom(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 294
    iget v0, p0, Lorg/comic/CLayoutView;->m_status:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    return v1

    .line 295
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

    .line 297
    :cond_1
    iget v0, p0, Lorg/comic/CLayoutView;->m_status:I

    if-ne v0, v2, :cond_4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-lt v0, v3, :cond_4

    .line 298
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 299
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v1, p1

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    float-to-double v0, v0

    .line 300
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    .line 301
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v1, p0, Lorg/comic/CLayoutView;->m_hold_x:F

    float-to-int v1, v1

    iget v3, p0, Lorg/comic/CLayoutView;->m_hold_y:F

    float-to-int v3, v3

    iget-object v4, p0, Lorg/comic/CLayoutView;->m_zoom_pos:Lorg/comic/CLayout$Pos;

    iget v5, p0, Lorg/comic/CLayoutView;->m_zoom_scale:F

    mul-float v5, v5, p1

    iget p1, p0, Lorg/comic/CLayoutView;->m_zoom_dis0:F

    div-float/2addr v5, p1

    invoke-virtual {v0, v1, v3, v4, v5}, Lorg/comic/CLayout;->vZoomSet(IILorg/comic/CLayout$Pos;F)V

    .line 302
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->invalidate()V

    goto :goto_0

    .line 308
    :cond_2
    iget v0, p0, Lorg/comic/CLayoutView;->m_status:I

    if-ne v0, v2, :cond_4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ne v0, v3, :cond_4

    .line 309
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 310
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v3, p1

    mul-float v0, v0, v0

    mul-float v3, v3, v3

    add-float/2addr v0, v3

    float-to-double v3, v0

    .line 311
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    double-to-float p1, v3

    .line 312
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v3, p0, Lorg/comic/CLayoutView;->m_hold_x:F

    float-to-int v3, v3

    iget v4, p0, Lorg/comic/CLayoutView;->m_hold_y:F

    float-to-int v4, v4

    iget-object v5, p0, Lorg/comic/CLayoutView;->m_zoom_pos:Lorg/comic/CLayout$Pos;

    iget v6, p0, Lorg/comic/CLayoutView;->m_zoom_scale:F

    mul-float v6, v6, p1

    iget p1, p0, Lorg/comic/CLayoutView;->m_zoom_dis0:F

    div-float/2addr v6, p1

    invoke-virtual {v0, v3, v4, v5, v6}, Lorg/comic/CLayout;->vZoomSet(IILorg/comic/CLayout$Pos;F)V

    const p1, -0x39e3c000    # -10000.0f

    .line 313
    iput p1, p0, Lorg/comic/CLayoutView;->m_hold_x:F

    .line 314
    iput p1, p0, Lorg/comic/CLayoutView;->m_hold_y:F

    .line 315
    iput v1, p0, Lorg/comic/CLayoutView;->m_status:I

    .line 316
    iget p1, p0, Lorg/comic/CLayoutView;->m_zoom_scale:F

    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {v0}, Lorg/comic/CLayout;->vGetZoom()F

    move-result v0

    cmpg-float p1, p1, v0

    if-gez p1, :cond_3

    .line 317
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->invalidate()V

    .line 318
    :cond_3
    iput-boolean v1, p0, Lorg/comic/CLayoutView;->m_hold:Z

    .line 319
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_listener:Lorg/comic/ICLayoutView$CLayoutListener;

    if-eqz p1, :cond_4

    .line 320
    invoke-interface {p1}, Lorg/comic/ICLayoutView$CLayoutListener;->OnZoomEnd()V

    :cond_4
    :goto_0
    return v2
.end method


# virtual methods
.method public Close()V
    .locals 1

    .line 422
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    if-eqz v0, :cond_0

    .line 423
    invoke-virtual {v0}, Lorg/comic/CDocument;->Close()V

    .line 425
    :cond_0
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-eqz v0, :cond_1

    .line 426
    invoke-virtual {v0}, Lorg/comic/CLayout;->vClose()V

    const/4 v0, 0x0

    .line 427
    iput-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    const/4 v0, 0x0

    .line 428
    iput v0, p0, Lorg/comic/CLayoutView;->m_status:I

    const/4 v0, -0x1

    .line 429
    iput v0, p0, Lorg/comic/CLayoutView;->m_pageno:I

    :cond_1
    return-void
.end method

.method public final GetCurrPage()I
    .locals 1

    .line 473
    iget v0, p0, Lorg/comic/CLayoutView;->m_pageno:I

    return v0
.end method

.method public final GetDoc()Lorg/comic/CDocument;
    .locals 1

    .line 436
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    return-object v0
.end method

.method public GetMinScale()F
    .locals 1

    .line 467
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-eqz v0, :cond_0

    .line 468
    invoke-virtual {v0}, Lorg/comic/CLayout;->vGetMinScale()F

    move-result v0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public final GetPos(II)Lorg/comic/CLayout$Pos;
    .locals 1

    .line 448
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-eqz v0, :cond_0

    .line 449
    invoke-virtual {v0, p1, p2}, Lorg/comic/CLayout;->vGetPos(II)Lorg/comic/CLayout$Pos;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public GetScale()F
    .locals 1

    .line 461
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-eqz v0, :cond_0

    .line 462
    invoke-virtual {v0}, Lorg/comic/CLayout;->vGetScale()F

    move-result v0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public GetZoom()F
    .locals 1

    .line 444
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/comic/CLayout;->vGetZoom()F

    move-result v0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public GotoPage(I)V
    .locals 2

    .line 399
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-nez v0, :cond_0

    return-void

    .line 400
    :cond_0
    invoke-virtual {v0}, Lorg/comic/CLayout;->vGetHeight()I

    move-result v0

    if-lez v0, :cond_2

    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {v0}, Lorg/comic/CLayout;->vGetWidth()I

    move-result v0

    if-gtz v0, :cond_1

    goto :goto_0

    .line 406
    :cond_1
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {v0, p1}, Lorg/comic/CLayout;->vGotoPage(I)V

    .line 407
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->invalidate()V

    return-void

    .line 401
    :cond_2
    :goto_0
    new-instance v0, Lorg/comic/CLayout$Pos;

    invoke-direct {v0}, Lorg/comic/CLayout$Pos;-><init>()V

    iput-object v0, p0, Lorg/comic/CLayoutView;->m_goto_pos:Lorg/comic/CLayout$Pos;

    .line 402
    iput p1, v0, Lorg/comic/CLayout$Pos;->pageno:I

    .line 403
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_goto_pos:Lorg/comic/CLayout$Pos;

    const/4 v1, 0x0

    iput v1, v0, Lorg/comic/CLayout$Pos;->x:F

    .line 404
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_goto_pos:Lorg/comic/CLayout$Pos;

    iget-object v1, p0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v1, p1}, Lorg/comic/CDocument;->GetPageHeight(I)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    int-to-float p1, p1

    iput p1, v0, Lorg/comic/CLayout$Pos;->y:F

    return-void
.end method

.method public OnPageChanged(I)V
    .locals 1

    .line 415
    iput p1, p0, Lorg/comic/CLayoutView;->m_pageno:I

    .line 416
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_listener:Lorg/comic/ICLayoutView$CLayoutListener;

    if-eqz v0, :cond_0

    .line 417
    invoke-interface {v0, p1}, Lorg/comic/ICLayoutView$CLayoutListener;->OnPageChanged(I)V

    :cond_0
    return-void
.end method

.method public Open(Lorg/comic/CDocument;ILorg/comic/ICLayoutView$CLayoutListener;)V
    .locals 0

    .line 50
    iput-object p1, p0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    .line 51
    iput-object p3, p0, Lorg/comic/CLayoutView;->m_listener:Lorg/comic/ICLayoutView$CLayoutListener;

    if-lez p2, :cond_3

    .line 53
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getWidth()I

    move-result p1

    if-lez p1, :cond_0

    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getWidth()I

    move-result p1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 54
    :goto_0
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getHeight()I

    move-result p2

    if-lez p2, :cond_1

    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getHeight()I

    move-result p2

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->heightPixels:I

    :goto_1
    if-le p1, p2, :cond_2

    const/4 p1, 0x1

    const/4 p2, 0x1

    goto :goto_2

    :cond_2
    const/4 p1, 0x3

    const/4 p2, 0x3

    .line 64
    :cond_3
    :goto_2
    invoke-virtual {p0, p2}, Lorg/comic/CLayoutView;->SetView(I)V

    return-void
.end method

.method public final SetPos(Lorg/comic/CLayout$Pos;II)V
    .locals 1

    .line 454
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-eqz v0, :cond_0

    .line 455
    invoke-virtual {v0, p2, p3, p1}, Lorg/comic/CLayout;->vSetPos(IILorg/comic/CLayout$Pos;)V

    .line 456
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->invalidate()V

    :cond_0
    return-void
.end method

.method public SetView(I)V
    .locals 7

    .line 69
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {v0, v1, v1}, Lorg/comic/CLayout;->vGetPos(II)Lorg/comic/CLayout$Pos;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v2

    :goto_0
    const/4 v3, 0x1

    const/4 v4, 0x3

    if-eq p1, v3, :cond_2

    if-eq p1, v4, :cond_1

    .line 81
    new-instance v3, Lorg/comic/CLayoutVert;

    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/comic/CLayoutVert;-><init>(Landroid/content/Context;)V

    .line 82
    iput-object v3, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    goto :goto_1

    .line 76
    :cond_1
    new-instance v3, Lorg/comic/CLayoutSingle;

    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/comic/CLayoutSingle;-><init>(Landroid/content/Context;)V

    .line 77
    iput-object v3, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    goto :goto_1

    .line 73
    :cond_2
    new-instance v3, Lorg/comic/CLayoutHorz;

    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/comic/CLayoutHorz;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    .line 86
    :goto_1
    iget-object v3, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iput p1, p0, Lorg/comic/CLayoutView;->def_view:I

    iput p1, v3, Lorg/comic/CLayout;->def_view:I

    .line 87
    iget-object v3, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget-object v5, p0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v3, v5, p0}, Lorg/comic/CLayout;->vOpen(Lorg/comic/CDocument;Lorg/comic/CLayout$LayoutListener;)V

    .line 88
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getWidth()I

    move-result v3

    if-lez v3, :cond_6

    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getHeight()I

    move-result v3

    if-lez v3, :cond_6

    .line 89
    iget-object v3, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getWidth()I

    move-result v5

    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getHeight()I

    move-result v6

    invoke-virtual {v3, v5, v6}, Lorg/comic/CLayout;->vResize(II)V

    .line 90
    iget-object v3, p0, Lorg/comic/CLayoutView;->m_goto_pos:Lorg/comic/CLayout$Pos;

    if-eqz v3, :cond_3

    .line 91
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p1, v1, v1, v3}, Lorg/comic/CLayout;->vSetPos(IILorg/comic/CLayout$Pos;)V

    .line 92
    iput-object v2, p0, Lorg/comic/CLayoutView;->m_goto_pos:Lorg/comic/CLayout$Pos;

    .line 93
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->invalidate()V

    goto :goto_3

    :cond_3
    if-eqz v0, :cond_6

    if-eq p1, v4, :cond_5

    const/4 v2, 0x4

    if-eq p1, v2, :cond_5

    const/4 v2, 0x6

    if-ne p1, v2, :cond_4

    goto :goto_2

    .line 98
    :cond_4
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p1, v1, v1, v0}, Lorg/comic/CLayout;->vSetPos(IILorg/comic/CLayout$Pos;)V

    goto :goto_3

    .line 96
    :cond_5
    :goto_2
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget v0, v0, Lorg/comic/CLayout$Pos;->pageno:I

    invoke-virtual {p1, v0}, Lorg/comic/CLayout;->vGotoPage(I)V

    .line 102
    :cond_6
    :goto_3
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->invalidate()V

    return-void
.end method

.method public SetZoom(IILorg/comic/CLayout$Pos;F)V
    .locals 1

    .line 440
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/comic/CLayout;->vZoomSet(IILorg/comic/CLayout$Pos;F)V

    :cond_0
    return-void
.end method

.method public computeScroll()V
    .locals 1

    .line 194
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/comic/CLayout;->vScrollCompute()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->invalidate()V

    :cond_0
    return-void
.end method

.method public doTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 106
    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 107
    :cond_0
    invoke-direct {p0, p1}, Lorg/comic/CLayoutView;->onTouchNone(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    return v1

    .line 108
    :cond_1
    invoke-direct {p0, p1}, Lorg/comic/CLayoutView;->onTouchZoom(Landroid/view/MotionEvent;)Z

    return v1
.end method

.method public formateSize(J)Ljava/lang/String;
    .locals 1

    .line 189
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMemoryInfo()Ljava/lang/String;
    .locals 8

    .line 180
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    .line 181
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v2

    .line 182
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v4

    .line 183
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "max:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lorg/comic/CLayoutView;->formateSize(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " free:"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    invoke-virtual {p0, v4, v5}, Lorg/comic/CLayoutView;->formateSize(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "|take:"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sub-long/2addr v2, v4

    invoke-virtual {p0, v2, v3}, Lorg/comic/CLayoutView;->formateSize(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 117
    sget v0, Lcom/radaee/pdf/Global;->pdf_theme:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/radaee/pdf/Global;->dark_mode:Z

    .line 118
    sget v0, Lcom/radaee/pdf/Global;->pdf_theme:I

    if-le v0, v2, :cond_2

    .line 120
    :try_start_0
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getWidth()I

    move-result v0

    .line 121
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->getHeight()I

    move-result v2

    .line 122
    iget-object v3, p0, Lorg/comic/CLayoutView;->themeCanvas:Landroid/graphics/Canvas;

    if-nez v3, :cond_1

    .line 123
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lorg/comic/CLayoutView;->themeBitmap:Landroid/graphics/Bitmap;

    .line 124
    new-instance v3, Landroid/graphics/Canvas;

    iget-object v4, p0, Lorg/comic/CLayoutView;->themeBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v3, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v3, p0, Lorg/comic/CLayoutView;->themeCanvas:Landroid/graphics/Canvas;

    .line 126
    :cond_1
    iget-object v3, p0, Lorg/comic/CLayoutView;->themeCanvas:Landroid/graphics/Canvas;

    invoke-direct {p0, v3}, Lorg/comic/CLayoutView;->doOnDraw(Landroid/graphics/Canvas;)V

    .line 127
    new-instance v3, Landroid/graphics/ColorMatrix;

    invoke-direct {v3}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 128
    sget v4, Lcom/radaee/pdf/Global;->pdf_theme:I

    invoke-static {v4}, Lcom/radaee/pdf/Global;->getThemeArray(I)[F

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/ColorMatrix;->set([F)V

    .line 129
    new-instance v4, Landroid/graphics/ColorMatrixColorFilter;

    invoke-direct {v4, v3}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 130
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 131
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 132
    iget-object v4, p0, Lorg/comic/CLayoutView;->themeBitmap:Landroid/graphics/Bitmap;

    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5, v1, v1, v0, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6, v1, v1, v0, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, v4, v5, v6, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 138
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 139
    invoke-direct {p0, p1}, Lorg/comic/CLayoutView;->doOnDraw(Landroid/graphics/Canvas;)V

    goto :goto_1

    .line 136
    :catch_1
    invoke-direct {p0, p1}, Lorg/comic/CLayoutView;->doOnDraw(Landroid/graphics/Canvas;)V

    :goto_1
    return-void

    .line 142
    :cond_2
    invoke-direct {p0, p1}, Lorg/comic/CLayoutView;->doOnDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 1

    .line 200
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    if-eq p1, p3, :cond_2

    if-ne p2, p4, :cond_0

    goto :goto_0

    .line 203
    :cond_0
    iget-object p3, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-eqz p3, :cond_2

    if-lez p1, :cond_2

    if-lez p2, :cond_2

    .line 204
    invoke-virtual {p3, p1, p2}, Lorg/comic/CLayout;->vResize(II)V

    .line 206
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_goto_pos:Lorg/comic/CLayout$Pos;

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    .line 207
    iget p1, p1, Lorg/comic/CLayout$Pos;->pageno:I

    iput p1, p0, Lorg/comic/CLayoutView;->m_pageno:I

    .line 208
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget-object p3, p0, Lorg/comic/CLayoutView;->m_goto_pos:Lorg/comic/CLayout$Pos;

    invoke-virtual {p1, p2, p2, p3}, Lorg/comic/CLayout;->vSetPos(IILorg/comic/CLayout$Pos;)V

    const/4 p1, 0x0

    .line 209
    iput-object p1, p0, Lorg/comic/CLayoutView;->m_goto_pos:Lorg/comic/CLayout$Pos;

    .line 210
    invoke-virtual {p0}, Lorg/comic/CLayoutView;->invalidate()V

    .line 213
    :cond_1
    iget-object p1, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p1}, Lorg/comic/CLayout;->vGetWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    iget-object p4, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p4}, Lorg/comic/CLayout;->vGetHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    iget-object v0, p0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {v0, p2, p2}, Lorg/comic/CLayout;->vGetPos(II)Lorg/comic/CLayout$Pos;

    move-result-object p2

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, p3, p4, p2, v0}, Lorg/comic/CLayout;->vZoomSet(IILorg/comic/CLayout$Pos;F)V

    .line 214
    iget p1, p0, Lorg/comic/CLayoutView;->m_pageno:I

    invoke-virtual {p0, p1}, Lorg/comic/CLayoutView;->GotoPage(I)V

    :cond_2
    :goto_0
    return-void
.end method
