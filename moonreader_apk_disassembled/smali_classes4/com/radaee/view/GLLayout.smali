.class public abstract Lcom/radaee/view/GLLayout;
.super Ljava/lang/Object;
.source "GLLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/view/GLLayout$GLListener;,
        Lcom/radaee/view/GLLayout$PDFPos;
    }
.end annotation


# static fields
.field protected static m_max_zoom:F


# instance fields
.field protected m_ctx:Landroid/content/Context;

.field protected m_def_text:I

.field protected m_doc:Lcom/radaee/pdf/Document;

.field protected m_finder:Lcom/radaee/view/VFinder;

.field private final m_hand_gl:Landroid/os/Handler;

.field protected m_layh:I

.field protected m_layw:I

.field protected m_listener:Lcom/radaee/view/GLLayout$GLListener;

.field protected m_page_cnt:I

.field protected m_page_gap:I

.field protected m_pageno1:I

.field protected m_pageno2:I

.field protected m_pages:[Lcom/radaee/view/GLPage;

.field public m_scale:F

.field public m_scale_min:F

.field public m_scroller:Landroid/widget/Scroller;

.field protected m_thread:Lcom/radaee/view/GLThread;

.field protected m_vh:I

.field protected m_vw:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    sget v0, Lcom/radaee/pdf/Global;->g_layout_zoom_level:F

    sput v0, Lcom/radaee/view/GLLayout;->m_max_zoom:F

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Lcom/radaee/view/GLLayout$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/radaee/view/GLLayout$1;-><init>(Lcom/radaee/view/GLLayout;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/radaee/view/GLLayout;->m_hand_gl:Landroid/os/Handler;

    .line 83
    iput-object p1, p0, Lcom/radaee/view/GLLayout;->m_ctx:Landroid/content/Context;

    .line 84
    new-instance v0, Landroid/widget/Scroller;

    invoke-direct {v0, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    const/4 v0, 0x0

    .line 85
    invoke-direct {p0, v0, v0, v0, v0}, Lcom/radaee/view/GLLayout;->scrollerStartScroll(IIII)V

    .line 86
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    const/high16 v1, -0x40800000    # -1.0f

    .line 87
    iput v1, p0, Lcom/radaee/view/GLLayout;->m_scale:F

    .line 88
    iput v0, p0, Lcom/radaee/view/GLLayout;->m_layw:I

    .line 89
    iput v0, p0, Lcom/radaee/view/GLLayout;->m_layh:I

    .line 90
    iput v0, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    .line 91
    iput v0, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    .line 92
    iput v0, p0, Lcom/radaee/view/GLLayout;->m_def_text:I

    .line 94
    sget v0, Lcom/radaee/view/GLBlock;->m_cell_size:I

    if-gtz v0, :cond_0

    .line 95
    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    .line 96
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 97
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 98
    iget p1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    sput p1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    .line 99
    sget p1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    if-le p1, v1, :cond_0

    iget p1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    sput p1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    :cond_0
    return-void
.end method

.method private scrollerStartScroll(IIII)V
    .locals 6

    .line 475
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-static {}, Lcom/radaee/pdf/Global;->scrollDuration()I

    move-result v5

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    return-void
.end method


# virtual methods
.method public final gl_abort_scroll()V
    .locals 7

    .line 335
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_doc:Lcom/radaee/pdf/Document;

    if-nez v0, :cond_0

    goto :goto_0

    .line 336
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_1

    :goto_0
    return-void

    .line 337
    :cond_1
    new-instance v1, Landroid/widget/Scroller;

    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_ctx:Landroid/content/Context;

    invoke-direct {v1, v0}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    .line 338
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 339
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v2

    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 340
    iput-object v1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    .line 341
    invoke-virtual {v1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    return-void
.end method

.method public gl_click(II)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public gl_close(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 5

    .line 158
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_def_text:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 160
    filled-new-array {v0}, [I

    move-result-object v0

    const/4 v2, 0x1

    invoke-interface {p1, v2, v0, v1}, Ljavax/microedition/khronos/opengles/GL10;->glDeleteTextures(I[II)V

    .line 161
    iput v1, p0, Lcom/radaee/view/GLLayout;->m_def_text:I

    .line 163
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    .line 165
    :goto_0
    iget v3, p0, Lcom/radaee/view/GLLayout;->m_page_cnt:I

    if-ge v0, v3, :cond_1

    .line 167
    iget-object v3, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v3, v3, v0

    iget-object v4, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v3, p1, v4}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 168
    iget-object v3, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v3, v3, v0

    iget-object v4, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v3, p1, v4}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 170
    :cond_1
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    .line 171
    iput-object v2, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    .line 172
    invoke-virtual {p1}, Lcom/radaee/view/GLThread;->destroy()V

    .line 174
    :cond_2
    iput-object v2, p0, Lcom/radaee/view/GLLayout;->m_doc:Lcom/radaee/pdf/Document;

    .line 175
    iput-object v2, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    const/high16 p1, -0x40800000    # -1.0f

    .line 176
    iput p1, p0, Lcom/radaee/view/GLLayout;->m_scale:F

    .line 177
    iput v1, p0, Lcom/radaee/view/GLLayout;->m_layw:I

    .line 178
    iput v1, p0, Lcom/radaee/view/GLLayout;->m_layh:I

    .line 179
    iput v1, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    .line 180
    iput v1, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    return-void
.end method

.method public gl_down(II)V
    .locals 0

    return-void
.end method

.method public gl_draw(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 9

    .line 248
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_doc:Lcom/radaee/pdf/Document;

    if-nez v0, :cond_0

    goto :goto_1

    .line 249
    :cond_0
    invoke-virtual {p0, p1}, Lcom/radaee/view/GLLayout;->gl_flush_range(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 250
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v5

    .line 251
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v6

    .line 252
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_pageno1:I

    :goto_0
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_pageno2:I

    if-ge v0, v1, :cond_1

    .line 253
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v1, v1, v0

    iget-object v3, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    iget v4, p0, Lcom/radaee/view/GLLayout;->m_def_text:I

    iget v7, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    iget v8, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    move-object v2, p1

    invoke-virtual/range {v1 .. v8}, Lcom/radaee/view/GLPage;->gl_draw(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;IIIII)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public gl_fill_color(Ljavax/microedition/khronos/opengles/GL10;IIIIFFF)V
    .locals 13

    .line 244
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_def_text:I

    shl-int/lit8 v2, p2, 0x10

    shl-int/lit8 v3, p3, 0x10

    shl-int/lit8 v4, p4, 0x10

    shl-int/lit8 v7, p5, 0x10

    move v5, v3

    move v6, v2

    move v8, v4

    move v9, v7

    move-object v0, p1

    move/from16 v10, p6

    move/from16 v11, p7

    move/from16 v12, p8

    invoke-static/range {v0 .. v12}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    return-void
.end method

.method public gl_fling(IIFFFF)Z
    .locals 9

    .line 345
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 346
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 347
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v1

    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v2

    neg-float p1, p5

    float-to-int v3, p1

    neg-float p1, p6

    float-to-int v4, p1

    iget p1, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    neg-int v5, p1

    iget v6, p0, Lcom/radaee/view/GLLayout;->m_layw:I

    iget p1, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    neg-int v7, p1

    iget v8, p0, Lcom/radaee/view/GLLayout;->m_layh:I

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    return p2
.end method

.method protected gl_flush_range(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 7

    .line 188
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/radaee/view/GLLayout;->m_pageno2:I

    iget v1, p0, Lcom/radaee/view/GLLayout;->m_pageno1:I

    if-le v0, v1, :cond_0

    return-void

    .line 189
    :cond_0
    sget v0, Lcom/radaee/view/GLBlock;->m_cell_size:I

    neg-int v0, v0

    sget v1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    neg-int v1, v1

    invoke-virtual {p0, v0, v1}, Lcom/radaee/view/GLLayout;->vGetPage(II)I

    move-result v0

    .line 190
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    sget v2, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v1, v2

    iget v2, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    sget v3, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/radaee/view/GLLayout;->vGetPage(II)I

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

    .line 200
    iget v2, p0, Lcom/radaee/view/GLLayout;->m_pageno1:I

    if-ge v2, v1, :cond_3

    .line 204
    iget v3, p0, Lcom/radaee/view/GLLayout;->m_pageno2:I

    if-le v1, v3, :cond_2

    goto :goto_1

    :cond_2
    move v3, v1

    :goto_1
    if-ge v2, v3, :cond_3

    .line 207
    iget-object v4, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v2

    .line 208
    iget-object v5, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 209
    iget-object v5, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 213
    :cond_3
    iget v2, p0, Lcom/radaee/view/GLLayout;->m_pageno2:I

    if-le v2, v0, :cond_5

    .line 217
    iget v3, p0, Lcom/radaee/view/GLLayout;->m_pageno1:I

    if-ge v0, v3, :cond_4

    goto :goto_2

    :cond_4
    move v3, v0

    :goto_2
    if-ge v3, v2, :cond_5

    .line 220
    iget-object v4, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v3

    .line 221
    iget-object v5, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 222
    iget-object v5, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_5
    move v6, v1

    move v1, v0

    move v0, v6

    goto :goto_4

    .line 229
    :cond_6
    iget v2, p0, Lcom/radaee/view/GLLayout;->m_pageno1:I

    .line 230
    iget v3, p0, Lcom/radaee/view/GLLayout;->m_pageno2:I

    :goto_3
    if-ge v2, v3, :cond_7

    .line 233
    iget-object v4, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v2

    .line 234
    iget-object v5, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 235
    iget-object v5, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 239
    :cond_7
    :goto_4
    iput v0, p0, Lcom/radaee/view/GLLayout;->m_pageno1:I

    .line 240
    iput v1, p0, Lcom/radaee/view/GLLayout;->m_pageno2:I

    return-void
.end method

.method public final gl_is_scroll_finished()Z
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    return v0
.end method

.method public abstract gl_layout(FZ)V
.end method

.method public gl_move(II)V
    .locals 0

    return-void
.end method

.method public gl_move_end()V
    .locals 0

    return-void
.end method

.method public gl_render(Lcom/radaee/view/GLPage;)V
    .locals 1

    .line 431
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 432
    :cond_0
    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->gl_set_dirty()V

    :cond_1
    :goto_0
    return-void
.end method

.method public gl_render(Lcom/radaee/view/GLPage;[F)V
    .locals 4

    .line 442
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 443
    aget v0, p2, v0

    const/4 v1, 0x1

    aget v1, p2, v1

    const/4 v2, 0x2

    aget v2, p2, v2

    const/4 v3, 0x3

    aget p2, p2, v3

    invoke-virtual {p1, v0, v1, v2, p2}, Lcom/radaee/view/GLPage;->gl_set_dirty(FFFF)V

    :cond_1
    :goto_0
    return-void
.end method

.method public gl_reset(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 3

    .line 310
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 312
    :goto_0
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_page_cnt:I

    if-ge v0, v1, :cond_0

    .line 313
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v1, p1, v2}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public gl_resize(II)V
    .locals 2

    if-lez p1, :cond_2

    if-gtz p2, :cond_0

    goto :goto_0

    .line 324
    :cond_0
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    if-ne p1, v0, :cond_1

    iget v0, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    if-ne p2, v0, :cond_1

    goto :goto_0

    .line 325
    :cond_1
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->gl_abort_scroll()V

    .line 326
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    shr-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    shr-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v0

    .line 327
    iput p1, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    .line 328
    iput p2, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    .line 329
    iget p1, p0, Lcom/radaee/view/GLLayout;->m_scale:F

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/radaee/view/GLLayout;->gl_layout(FZ)V

    .line 330
    iget p1, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    shr-int/lit8 p1, p1, 0x1

    iget p2, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    shr-int/lit8 p2, p2, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/radaee/view/GLLayout;->vSetPos(IILcom/radaee/view/GLLayout$PDFPos;)V

    .line 331
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->gl_move_end()V

    :cond_2
    :goto_0
    return-void
.end method

.method public gl_surface_create(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 6

    .line 122
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_def_text:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 124
    filled-new-array {v0}, [I

    move-result-object v0

    invoke-interface {p1, v1, v0, v2}, Ljavax/microedition/khronos/opengles/GL10;->glDeleteTextures(I[II)V

    .line 125
    iput v2, p0, Lcom/radaee/view/GLLayout;->m_def_text:I

    .line 127
    :cond_0
    new-array v0, v1, [I

    .line 128
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v4, 0x8

    invoke-static {v4, v4, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    const/4 v4, -0x1

    .line 129
    invoke-virtual {v3, v4}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 130
    invoke-interface {p1, v1, v0, v2}, Ljavax/microedition/khronos/opengles/GL10;->glGenTextures(I[II)V

    .line 131
    aget v1, v0, v2

    const/16 v4, 0xde1

    invoke-interface {p1, v4, v1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/16 v1, 0x2801

    const/high16 v5, 0x46180000    # 9728.0f

    .line 132
    invoke-interface {p1, v4, v1, v5}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    const/16 v1, 0x2800

    const v5, 0x46180400    # 9729.0f

    .line 133
    invoke-interface {p1, v4, v1, v5}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 134
    invoke-static {v4, v2, v3, v2}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 135
    invoke-interface {p1, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 136
    aget p1, v0, v2

    iput p1, p0, Lcom/radaee/view/GLLayout;->m_def_text:I

    .line 138
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    return-void
.end method

.method public gl_surface_destroy(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 3

    .line 142
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_def_text:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 144
    filled-new-array {v0}, [I

    move-result-object v0

    const/4 v2, 0x1

    invoke-interface {p1, v2, v0, v1}, Ljavax/microedition/khronos/opengles/GL10;->glDeleteTextures(I[II)V

    .line 145
    iput v1, p0, Lcom/radaee/view/GLLayout;->m_def_text:I

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    if-eqz v0, :cond_1

    .line 149
    :goto_0
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_page_cnt:I

    if-ge v1, v0, :cond_1

    .line 151
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v0, v0, v1

    iget-object v2, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v0, p1, v2}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 152
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v0, v0, v1

    iget-object v2, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v0, p1, v2}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public gl_sync()V
    .locals 8

    .line 256
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_doc:Lcom/radaee/pdf/Document;

    if-nez v0, :cond_0

    return-void

    .line 257
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 258
    sget v0, Lcom/radaee/view/GLBlock;->m_cell_size:I

    neg-int v0, v0

    sget v1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    neg-int v1, v1

    invoke-virtual {p0, v0, v1}, Lcom/radaee/view/GLLayout;->vGetPage(II)I

    move-result v0

    .line 259
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    sget v2, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v1, v2

    iget v2, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    sget v3, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/radaee/view/GLLayout;->vGetPage(II)I

    move-result v1

    if-ltz v0, :cond_2

    if-ltz v1, :cond_2

    if-le v0, v1, :cond_1

    goto :goto_0

    :cond_1
    move v7, v1

    move v1, v0

    move v0, v7

    :goto_0
    add-int/lit8 v0, v0, 0x1

    move v7, v1

    move v1, v0

    move v0, v7

    .line 267
    :cond_2
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v2

    .line 268
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v3

    :goto_1
    if-ge v0, v1, :cond_3

    .line 270
    iget-object v4, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v0

    iget v5, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    iget v6, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    invoke-virtual {v4, v2, v3, v5, v6}, Lcom/radaee/view/GLPage;->gl_sync(IIII)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 271
    :cond_3
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    return-void
.end method

.method public gl_zoom_confirm(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 3

    const/4 v0, 0x0

    .line 417
    :goto_0
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_page_cnt:I

    if-ge v0, v1, :cond_2

    .line 419
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_pageno1:I

    if-lt v0, v1, :cond_0

    iget v1, p0, Lcom/radaee/view/GLLayout;->m_pageno2:I

    if-lt v0, v1, :cond_1

    .line 420
    :cond_0
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v1, p1, v2}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 421
    :cond_1
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v1, p1, v2}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 422
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/radaee/view/GLPage;->gl_alloc()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public final gl_zoom_set(F)V
    .locals 1

    .line 400
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_scale_min:F

    mul-float p1, p1, v0

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/radaee/view/GLLayout;->gl_layout(FZ)V

    return-void
.end method

.method public gl_zoom_set_pos(IILcom/radaee/view/GLLayout$PDFPos;)V
    .locals 0

    .line 404
    invoke-virtual {p0, p1, p2, p3}, Lcom/radaee/view/GLLayout;->vSetPos(IILcom/radaee/view/GLLayout$PDFPos;)V

    return-void
.end method

.method public gl_zoom_start(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 3

    .line 408
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_pageno1:I

    if-ltz v0, :cond_1

    iget v0, p0, Lcom/radaee/view/GLLayout;->m_pageno2:I

    if-gez v0, :cond_0

    goto :goto_1

    .line 409
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->gl_abort_scroll()V

    const/4 v0, 0x0

    .line 410
    :goto_0
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_page_cnt:I

    if-ge v0, v1, :cond_1

    .line 412
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v1, p1, v2}, Lcom/radaee/view/GLPage;->gl_zoom_start(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public vCanSave()Z
    .locals 1

    .line 536
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->CanSave()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final vClear(Ljavax/microedition/khronos/opengles/GL10;I)V
    .locals 14

    move-object v0, p1

    move/from16 v1, p2

    .line 555
    iget v2, p0, Lcom/radaee/view/GLLayout;->m_def_text:I

    const/16 v13, 0xde1

    invoke-interface {p1, v13, v2}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 556
    iget v2, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    shl-int/lit8 v4, v2, 0x10

    iget v3, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    shl-int/lit8 v7, v3, 0x10

    shl-int/lit8 v8, v2, 0x10

    shl-int/lit8 v9, v3, 0x10

    shr-int/lit8 v2, v1, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-float v2, v2

    const/high16 v3, 0x437f0000    # 255.0f

    div-float v10, v2, v3

    shr-int/lit8 v2, v1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-float v2, v2

    div-float v11, v2, v3

    and-int/lit16 v1, v1, 0xff

    int-to-float v1, v1

    div-float v12, v1, v3

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v0 .. v12}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    .line 558
    invoke-interface {p1, v13, v1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    return-void
.end method

.method public vFind(I)I
    .locals 3

    .line 511
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    .line 512
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {v0, p1}, Lcom/radaee/view/VFinder;->find_prepare(I)I

    move-result p1

    const/4 v0, 0x0

    const/4 v2, 0x1

    if-ne p1, v2, :cond_2

    .line 515
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_listener:Lcom/radaee/view/GLLayout$GLListener;

    if-eqz p1, :cond_1

    .line 516
    invoke-interface {p1, v2}, Lcom/radaee/view/GLLayout$GLListener;->OnFound(Z)V

    .line 517
    :cond_1
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vFindGoto()V

    return v0

    :cond_2
    if-nez p1, :cond_4

    .line 522
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_listener:Lcom/radaee/view/GLLayout$GLListener;

    if-eqz p1, :cond_3

    .line 523
    invoke-interface {p1, v0}, Lcom/radaee/view/GLLayout$GLListener;->OnFound(Z)V

    :cond_3
    return v1

    .line 526
    :cond_4
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {p1, v0}, Lcom/radaee/view/GLThread;->find_start(Lcom/radaee/view/VFinder;)V

    return v2
.end method

.method public vFindDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 541
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {v0}, Lcom/radaee/view/VFinder;->find_get_page()I

    move-result v0

    .line 542
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_pageno1:I

    if-lt v0, v1, :cond_0

    iget v1, p0, Lcom/radaee/view/GLLayout;->m_pageno2:I

    if-ge v0, v1, :cond_0

    .line 543
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_finder:Lcom/radaee/view/VFinder;

    iget-object v2, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v0, v2, v0

    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v2

    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v3

    invoke-virtual {v1, p1, v0, v2, v3}, Lcom/radaee/view/VFinder;->find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/GLPage;II)V

    :cond_0
    return-void
.end method

.method public vFindEnd()V
    .locals 1

    .line 530
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    if-nez v0, :cond_0

    return-void

    .line 531
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {v0}, Lcom/radaee/view/VFinder;->find_end()V

    return-void
.end method

.method protected vFindGoto()V
    .locals 11

    .line 486
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 487
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {v0}, Lcom/radaee/view/VFinder;->find_get_page()I

    move-result v0

    if-ltz v0, :cond_b

    .line 488
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v1

    if-lt v0, v1, :cond_1

    goto/16 :goto_1

    .line 489
    :cond_1
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v1

    .line 490
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v2

    .line 491
    iget-object v3, p0, Lcom/radaee/view/GLLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {v3}, Lcom/radaee/view/VFinder;->find_get_pos()[F

    move-result-object v3

    if-nez v3, :cond_2

    goto/16 :goto_1

    .line 493
    :cond_2
    iget-object v4, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v0

    const/4 v5, 0x0

    aget v6, v3, v5

    invoke-virtual {v4, v6}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v4

    int-to-float v4, v4

    aput v4, v3, v5

    .line 494
    iget-object v4, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v0

    const/4 v6, 0x1

    aget v7, v3, v6

    invoke-virtual {v4, v7}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result v4

    int-to-float v4, v4

    aput v4, v3, v6

    .line 495
    iget-object v4, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v0

    const/4 v7, 0x2

    aget v8, v3, v7

    invoke-virtual {v4, v8}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v4

    int-to-float v4, v4

    aput v4, v3, v7

    .line 496
    iget-object v4, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v0, v4, v0

    const/4 v4, 0x3

    aget v8, v3, v4

    invoke-virtual {v0, v8}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result v0

    int-to-float v0, v0

    aput v0, v3, v4

    int-to-float v4, v1

    .line 497
    aget v8, v3, v5

    iget v9, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    div-int/lit8 v10, v9, 0x8

    int-to-float v10, v10

    sub-float v10, v8, v10

    cmpl-float v4, v4, v10

    if-lez v4, :cond_3

    float-to-int v1, v8

    div-int/lit8 v4, v9, 0x8

    sub-int/2addr v1, v4

    :cond_3
    int-to-float v4, v1

    .line 498
    aget v7, v3, v7

    mul-int/lit8 v8, v9, 0x7

    div-int/lit8 v8, v8, 0x8

    int-to-float v8, v8

    sub-float v8, v7, v8

    cmpg-float v4, v4, v8

    if-gez v4, :cond_4

    float-to-int v1, v7

    mul-int/lit8 v4, v9, 0x7

    div-int/lit8 v4, v4, 0x8

    sub-int/2addr v1, v4

    :cond_4
    int-to-float v4, v2

    .line 499
    aget v3, v3, v6

    iget v6, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    div-int/lit8 v7, v6, 0x8

    int-to-float v7, v7

    sub-float v7, v3, v7

    cmpl-float v4, v4, v7

    if-lez v4, :cond_5

    float-to-int v2, v3

    div-int/lit8 v3, v6, 0x8

    sub-int/2addr v2, v3

    :cond_5
    int-to-float v3, v2

    mul-int/lit8 v4, v6, 0x7

    .line 500
    div-int/lit8 v4, v4, 0x8

    int-to-float v4, v4

    sub-float v4, v0, v4

    cmpg-float v3, v3, v4

    if-gez v3, :cond_6

    float-to-int v0, v0

    mul-int/lit8 v2, v6, 0x7

    div-int/lit8 v2, v2, 0x8

    sub-int v2, v0, v2

    .line 501
    :cond_6
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_layw:I

    sub-int v3, v0, v9

    if-le v1, v3, :cond_7

    sub-int v1, v0, v9

    :cond_7
    if-gez v1, :cond_8

    const/4 v1, 0x0

    .line 503
    :cond_8
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_layh:I

    sub-int v3, v0, v6

    if-le v2, v3, :cond_9

    sub-int v2, v0, v6

    :cond_9
    if-gez v2, :cond_a

    goto :goto_0

    :cond_a
    move v5, v2

    .line 505
    :goto_0
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->gl_abort_scroll()V

    .line 506
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 507
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, v5}, Landroid/widget/Scroller;->setFinalY(I)V

    :cond_b
    :goto_1
    return-void
.end method

.method public vFindStart(Ljava/lang/String;ZZ)V
    .locals 7

    .line 479
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 480
    invoke-virtual {p0, v0, v0}, Lcom/radaee/view/GLLayout;->vGetPage(II)I

    move-result v3

    .line 481
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {v0}, Lcom/radaee/view/VFinder;->find_end()V

    .line 482
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_finder:Lcom/radaee/view/VFinder;

    iget-object v2, p0, Lcom/radaee/view/GLLayout;->m_doc:Lcom/radaee/pdf/Document;

    move-object v4, p1

    move v5, p2

    move v6, p3

    invoke-virtual/range {v1 .. v6}, Lcom/radaee/view/VFinder;->find_start(Lcom/radaee/pdf/Document;ILjava/lang/String;ZZ)V

    return-void
.end method

.method public abstract vGetPage(II)I
.end method

.method public final vGetPage(I)Lcom/radaee/view/GLPage;
    .locals 1

    .line 282
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;
    .locals 3

    .line 299
    invoke-virtual {p0, p1, p2}, Lcom/radaee/view/GLLayout;->vGetPage(II)I

    move-result v0

    if-ltz v0, :cond_1

    .line 300
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_page_cnt:I

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 301
    :cond_0
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v1, v1, v0

    .line 302
    new-instance v2, Lcom/radaee/view/GLLayout$PDFPos;

    invoke-direct {v2}, Lcom/radaee/view/GLLayout$PDFPos;-><init>()V

    .line 303
    iput v0, v2, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    .line 304
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {v1, v0}, Lcom/radaee/view/GLPage;->GetPDFX(I)F

    move-result p1

    iput p1, v2, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    .line 305
    invoke-virtual {p0}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result p1

    add-int/2addr p1, p2

    invoke-virtual {v1, p1}, Lcom/radaee/view/GLPage;->GetPDFY(I)F

    move-result p1

    iput p1, v2, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    return-object v2

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public final vGetX()I
    .locals 4

    .line 366
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 367
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    .line 368
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_layw:I

    iget v2, p0, Lcom/radaee/view/GLLayout;->m_vw:I

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

    .line 380
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 381
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    .line 382
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_layh:I

    iget v2, p0, Lcom/radaee/view/GLLayout;->m_vh:I

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
    .locals 2

    .line 393
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_scale:F

    iget v1, p0, Lcom/radaee/view/GLLayout;->m_scale_min:F

    div-float/2addr v0, v1

    .line 394
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    :cond_0
    return v0
.end method

.method public vGotoPage(I)V
    .locals 5

    .line 447
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    if-eqz v0, :cond_5

    if-ltz p1, :cond_5

    array-length v1, v0

    if-lt p1, v1, :cond_0

    goto :goto_1

    .line 448
    :cond_0
    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetLeft()I

    move-result v0

    iget v1, p0, Lcom/radaee/view/GLLayout;->m_page_gap:I

    shr-int/lit8 v1, v1, 0x1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    .line 449
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object p1, v1, p1

    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetTop()I

    move-result p1

    iget v1, p0, Lcom/radaee/view/GLLayout;->m_page_gap:I

    shr-int/lit8 v1, v1, 0x1

    sub-int/2addr p1, v1

    int-to-float p1, p1

    .line 450
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_layw:I

    iget v2, p0, Lcom/radaee/view/GLLayout;->m_vw:I

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

    .line 452
    :cond_2
    iget v2, p0, Lcom/radaee/view/GLLayout;->m_layh:I

    iget v3, p0, Lcom/radaee/view/GLLayout;->m_vh:I

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

    .line 454
    :goto_0
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    float-to-int v0, v0

    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 455
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    float-to-int v0, v1

    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 456
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 457
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->isFinished()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 458
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    :cond_5
    :goto_1
    return-void
.end method

.method public final vHasFind()Z
    .locals 3

    .line 547
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_finder:Lcom/radaee/view/VFinder;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 548
    :cond_0
    invoke-virtual {v0}, Lcom/radaee/view/VFinder;->find_get_page()I

    move-result v0

    .line 549
    iget v2, p0, Lcom/radaee/view/GLLayout;->m_pageno1:I

    if-lt v0, v2, :cond_1

    iget v2, p0, Lcom/radaee/view/GLLayout;->m_pageno2:I

    if-ge v0, v2, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    return v1
.end method

.method public vOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/GLLayout$GLListener;I)V
    .locals 1

    .line 106
    iput-object p1, p0, Lcom/radaee/view/GLLayout;->m_doc:Lcom/radaee/pdf/Document;

    .line 107
    iput p3, p0, Lcom/radaee/view/GLLayout;->m_page_gap:I

    .line 108
    new-instance p1, Lcom/radaee/view/VFinder;

    invoke-direct {p1}, Lcom/radaee/view/VFinder;-><init>()V

    iput-object p1, p0, Lcom/radaee/view/GLLayout;->m_finder:Lcom/radaee/view/VFinder;

    .line 109
    iput-object p2, p0, Lcom/radaee/view/GLLayout;->m_listener:Lcom/radaee/view/GLLayout$GLListener;

    .line 110
    new-instance p1, Lcom/radaee/view/GLThread;

    invoke-direct {p1}, Lcom/radaee/view/GLThread;-><init>()V

    iput-object p1, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    .line 111
    iget-object p2, p0, Lcom/radaee/view/GLLayout;->m_hand_gl:Landroid/os/Handler;

    invoke-virtual {p1, p2}, Lcom/radaee/view/GLThread;->set_handler(Landroid/os/Handler;)V

    .line 112
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {p1}, Lcom/radaee/view/GLThread;->start()V

    .line 113
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p1}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result p1

    iput p1, p0, Lcom/radaee/view/GLLayout;->m_page_cnt:I

    .line 114
    new-array p1, p1, [Lcom/radaee/view/GLPage;

    iput-object p1, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    const/4 p1, 0x0

    .line 115
    :goto_0
    iget p2, p0, Lcom/radaee/view/GLLayout;->m_page_cnt:I

    if-ge p1, p2, :cond_0

    .line 117
    iget-object p2, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    new-instance p3, Lcom/radaee/view/GLPage;

    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {p3, v0, p1}, Lcom/radaee/view/GLPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object p3, p2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final vRenderFinished()Z
    .locals 4

    .line 561
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_pageno1:I

    .line 562
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_pageno2:I

    const/4 v2, 0x1

    if-ltz v0, :cond_2

    if-gez v1, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    if-ge v0, v1, :cond_2

    .line 565
    iget-object v3, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Lcom/radaee/view/GLPage;->vFinished()Z

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

.method public vScrolltoPage(I)V
    .locals 5

    .line 462
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    if-eqz v0, :cond_5

    if-ltz p1, :cond_5

    array-length v1, v0

    if-lt p1, v1, :cond_0

    goto :goto_1

    .line 463
    :cond_0
    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetLeft()I

    move-result v0

    iget v1, p0, Lcom/radaee/view/GLLayout;->m_page_gap:I

    shr-int/lit8 v1, v1, 0x1

    sub-int/2addr v0, v1

    .line 464
    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object p1, v1, p1

    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetTop()I

    move-result p1

    iget v1, p0, Lcom/radaee/view/GLLayout;->m_page_gap:I

    shr-int/lit8 v1, v1, 0x1

    sub-int/2addr p1, v1

    .line 465
    iget v1, p0, Lcom/radaee/view/GLLayout;->m_layw:I

    iget v2, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    sub-int v3, v1, v2

    if-le v0, v3, :cond_1

    sub-int v0, v1, v2

    :cond_1
    const/4 v1, 0x0

    if-gez v0, :cond_2

    const/4 v0, 0x0

    .line 467
    :cond_2
    iget v2, p0, Lcom/radaee/view/GLLayout;->m_layh:I

    iget v3, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    sub-int v4, v2, v3

    if-le p1, v4, :cond_3

    sub-int p1, v2, v3

    :cond_3
    if-gez p1, :cond_4

    goto :goto_0

    :cond_4
    move v1, p1

    .line 469
    :goto_0
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 470
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->getCurrX()I

    move-result p1

    .line 471
    iget-object v2, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrY()I

    move-result v2

    sub-int/2addr v0, p1

    sub-int/2addr v1, v2

    .line 472
    invoke-direct {p0, p1, v2, v0, v1}, Lcom/radaee/view/GLLayout;->scrollerStartScroll(IIII)V

    :cond_5
    :goto_1
    return-void
.end method

.method public vSetPos(IILcom/radaee/view/GLLayout$PDFPos;)V
    .locals 3

    if-nez p3, :cond_0

    goto :goto_0

    .line 289
    :cond_0
    iget v0, p3, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    iget-object v1, p0, Lcom/radaee/view/GLLayout;->m_pages:[Lcom/radaee/view/GLPage;

    array-length v2, v1

    if-lt v0, v2, :cond_1

    goto :goto_0

    .line 290
    :cond_1
    iget v0, p3, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    aget-object v0, v1, v0

    .line 291
    iget v1, p3, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v1

    sub-int/2addr v1, p1

    invoke-virtual {p0, v1}, Lcom/radaee/view/GLLayout;->vSetX(I)V

    .line 292
    iget p1, p3, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    invoke-virtual {v0, p1}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result p1

    sub-int/2addr p1, p2

    invoke-virtual {p0, p1}, Lcom/radaee/view/GLLayout;->vSetY(I)V

    .line 293
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 294
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->isFinished()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 295
    iget-object p1, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->getCurrY()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalY(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public vSetX(I)V
    .locals 3

    .line 374
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_layw:I

    iget v1, p0, Lcom/radaee/view/GLLayout;->m_vw:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_0

    sub-int p1, v0, v1

    :cond_0
    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 376
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalX(I)V

    return-void
.end method

.method public vSetY(I)V
    .locals 3

    .line 388
    iget v0, p0, Lcom/radaee/view/GLLayout;->m_layh:I

    iget v1, p0, Lcom/radaee/view/GLLayout;->m_vh:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_0

    sub-int p1, v0, v1

    :cond_0
    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 390
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalY(I)V

    return-void
.end method

.method public vSupportZoom()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
