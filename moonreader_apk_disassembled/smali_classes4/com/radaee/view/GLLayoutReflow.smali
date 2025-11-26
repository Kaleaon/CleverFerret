.class public Lcom/radaee/view/GLLayoutReflow;
.super Lcom/radaee/view/GLLayout;
.source "GLLayoutReflow.java"


# static fields
.field private static BUTTON_SIZE:I = 0x3c


# instance fields
.field private m_cur_layout:Lcom/radaee/view/GLReflowCanvas;

.field private m_cur_page:I

.field private m_goto_layout:Lcom/radaee/view/GLReflowCanvas;

.field private m_goto_page:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1}, Lcom/radaee/view/GLLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    .line 19
    iput p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_page:I

    return-void
.end method


# virtual methods
.method public gl_click(II)I
    .locals 4

    .line 156
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vh:I

    sget v1, Lcom/radaee/view/GLLayoutReflow;->BUTTON_SIZE:I

    sub-int/2addr v0, v1

    const/4 v1, 0x1

    shr-int/2addr v0, v1

    if-le p2, v0, :cond_1

    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vh:I

    sget v2, Lcom/radaee/view/GLLayoutReflow;->BUTTON_SIZE:I

    add-int/2addr v0, v2

    shr-int/2addr v0, v1

    if-ge p2, v0, :cond_1

    const/4 p2, 0x2

    const/4 v0, 0x4

    if-le p1, v0, :cond_0

    add-int/2addr v2, v0

    if-ge p1, v2, :cond_0

    .line 160
    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    sub-int/2addr p1, v1

    invoke-virtual {p0, p1}, Lcom/radaee/view/GLLayoutReflow;->vGotoPage(I)V

    return p2

    .line 163
    :cond_0
    iget v2, p0, Lcom/radaee/view/GLLayoutReflow;->m_vw:I

    sget v3, Lcom/radaee/view/GLLayoutReflow;->BUTTON_SIZE:I

    sub-int/2addr v2, v3

    sub-int/2addr v2, v0

    if-le p1, v2, :cond_1

    iget v2, p0, Lcom/radaee/view/GLLayoutReflow;->m_vw:I

    sub-int/2addr v2, v0

    if-ge p1, v2, :cond_1

    .line 165
    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    add-int/2addr p1, v1

    invoke-virtual {p0, p1}, Lcom/radaee/view/GLLayoutReflow;->vGotoPage(I)V

    return p2

    :cond_1
    return v1
.end method

.method public gl_close(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 3

    .line 143
    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_layout:Lcom/radaee/view/GLReflowCanvas;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 144
    iget-object v2, p0, Lcom/radaee/view/GLLayoutReflow;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v0, p1, v2}, Lcom/radaee/view/GLReflowCanvas;->gl_close(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 145
    iput-object v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_layout:Lcom/radaee/view/GLReflowCanvas;

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_layout:Lcom/radaee/view/GLReflowCanvas;

    if-eqz v0, :cond_1

    .line 148
    iget-object v2, p0, Lcom/radaee/view/GLLayoutReflow;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v0, p1, v2}, Lcom/radaee/view/GLReflowCanvas;->gl_close(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 149
    iput-object v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_layout:Lcom/radaee/view/GLReflowCanvas;

    .line 151
    :cond_1
    invoke-super {p0, p1}, Lcom/radaee/view/GLLayout;->gl_close(Ljavax/microedition/khronos/opengles/GL10;)V

    return-void
.end method

.method public gl_draw(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 10

    .line 103
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_page:I

    if-ltz v0, :cond_1

    .line 105
    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_layout:Lcom/radaee/view/GLReflowCanvas;

    if-eqz v0, :cond_0

    .line 106
    iget-object v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v0, p1, v1}, Lcom/radaee/view/GLReflowCanvas;->gl_close(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 107
    :cond_0
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_page:I

    iput v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    .line 108
    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_layout:Lcom/radaee/view/GLReflowCanvas;

    iput-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_layout:Lcom/radaee/view/GLReflowCanvas;

    const/4 v0, -0x1

    .line 109
    iput v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_page:I

    const/4 v0, 0x0

    .line 110
    iput-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_layout:Lcom/radaee/view/GLReflowCanvas;

    .line 112
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_layout:Lcom/radaee/view/GLReflowCanvas;

    if-nez v0, :cond_2

    return-void

    .line 113
    :cond_2
    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 115
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutReflow;->vGetY()I

    move-result v5

    .line 116
    iget-object v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_layout:Lcom/radaee/view/GLReflowCanvas;

    iget-object v3, p0, Lcom/radaee/view/GLLayoutReflow;->m_thread:Lcom/radaee/view/GLThread;

    iget v4, p0, Lcom/radaee/view/GLLayoutReflow;->m_def_text:I

    iget v6, p0, Lcom/radaee/view/GLLayoutReflow;->m_vh:I

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Lcom/radaee/view/GLReflowCanvas;->gl_draw(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;III)V

    const/16 p1, 0x8

    .line 118
    new-array p1, p1, [I

    const/16 v0, 0xde1

    const/4 v1, 0x0

    .line 119
    invoke-interface {v2, v0, v1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/high16 v0, 0x3f000000    # 0.5f

    .line 120
    invoke-interface {v2, v0, v0, v0, v0}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    const/high16 v0, 0x40000

    .line 121
    aput v0, p1, v1

    .line 122
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vh:I

    shl-int/lit8 v0, v0, 0xf

    const/4 v3, 0x1

    aput v0, p1, v3

    .line 123
    sget v0, Lcom/radaee/view/GLLayoutReflow;->BUTTON_SIZE:I

    const/4 v4, 0x4

    add-int/2addr v0, v4

    shl-int/lit8 v0, v0, 0x10

    const/4 v5, 0x2

    aput v0, p1, v5

    .line 124
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vh:I

    sget v6, Lcom/radaee/view/GLLayoutReflow;->BUTTON_SIZE:I

    shl-int/lit8 v7, v6, 0x1

    sub-int/2addr v0, v7

    shl-int/lit8 v0, v0, 0xf

    const/4 v7, 0x3

    aput v0, p1, v7

    add-int/2addr v6, v4

    shl-int/lit8 v0, v6, 0x10

    .line 125
    aput v0, p1, v4

    .line 126
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vh:I

    sget v6, Lcom/radaee/view/GLLayoutReflow;->BUTTON_SIZE:I

    shl-int/2addr v6, v3

    add-int/2addr v0, v6

    shl-int/lit8 v0, v0, 0xf

    const/4 v6, 0x5

    aput v0, p1, v6

    .line 127
    invoke-static {p1}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object v0

    const/16 v8, 0x140c

    invoke-interface {v2, v5, v8, v1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 128
    invoke-interface {v2, v6, v1, v7}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 130
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vw:I

    sub-int/2addr v0, v4

    shl-int/lit8 v0, v0, 0x10

    aput v0, p1, v1

    .line 131
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vh:I

    shl-int/lit8 v0, v0, 0xf

    aput v0, p1, v3

    .line 132
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vw:I

    sget v9, Lcom/radaee/view/GLLayoutReflow;->BUTTON_SIZE:I

    sub-int/2addr v0, v9

    sub-int/2addr v0, v4

    shl-int/lit8 v0, v0, 0x10

    aput v0, p1, v5

    .line 133
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vh:I

    sget v9, Lcom/radaee/view/GLLayoutReflow;->BUTTON_SIZE:I

    shl-int/2addr v9, v3

    sub-int/2addr v0, v9

    shl-int/lit8 v0, v0, 0xf

    aput v0, p1, v7

    .line 134
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vw:I

    sget v9, Lcom/radaee/view/GLLayoutReflow;->BUTTON_SIZE:I

    sub-int/2addr v0, v9

    sub-int/2addr v0, v4

    shl-int/lit8 v0, v0, 0x10

    aput v0, p1, v4

    .line 135
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vh:I

    sget v4, Lcom/radaee/view/GLLayoutReflow;->BUTTON_SIZE:I

    shl-int/lit8 v3, v4, 0x1

    add-int/2addr v0, v3

    shl-int/lit8 v0, v0, 0xf

    aput v0, p1, v6

    .line 136
    invoke-static {p1}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object p1

    invoke-interface {v2, v5, v8, v1, p1}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 137
    invoke-interface {v2, v6, v1, v7}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    const/high16 p1, 0x3f800000    # 1.0f

    .line 138
    invoke-interface {v2, p1, p1, p1, p1}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    return-void
.end method

.method public gl_layout(FZ)V
    .locals 3

    .line 29
    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vw:I

    iget v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_page_gap:I

    if-le v0, v1, :cond_7

    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vh:I

    iget v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_page_gap:I

    if-gt v0, v1, :cond_0

    goto/16 :goto_1

    .line 30
    :cond_0
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_vw:I

    iget v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_page_gap:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget-object v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_scale_min:F

    .line 31
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_scale_min:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_scale_min:F

    .line 32
    :cond_1
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_scale_min:F

    sget v1, Lcom/radaee/pdf/Global;->g_view_zoom_level:F

    mul-float v0, v0, v1

    cmpl-float v0, p1, v0

    if-lez v0, :cond_2

    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_scale_min:F

    sget v0, Lcom/radaee/pdf/Global;->g_view_zoom_level:F

    mul-float p1, p1, v0

    .line 33
    :cond_2
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutReflow;->vSupportZoom()Z

    move-result v0

    if-nez v0, :cond_3

    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_scale_min:F

    const/high16 v0, 0x40000000    # 2.0f

    mul-float p1, p1, v0

    .line 34
    :cond_3
    iput p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_scale:F

    if-eqz p2, :cond_4

    goto :goto_1

    .line 38
    :cond_4
    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_page:I

    if-ltz p1, :cond_5

    .line 40
    iget-object p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_layout:Lcom/radaee/view/GLReflowCanvas;

    invoke-virtual {p1}, Lcom/radaee/view/GLReflowCanvas;->gl_destroy()V

    const/4 p1, 0x0

    .line 41
    iput-object p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_layout:Lcom/radaee/view/GLReflowCanvas;

    const/4 p1, -0x1

    .line 42
    iput p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_page:I

    .line 45
    :cond_5
    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_vw:I

    shr-int/lit8 p1, p1, 0x3

    sput p1, Lcom/radaee/view/GLLayoutReflow;->BUTTON_SIZE:I

    .line 46
    iget-object p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_pages:[Lcom/radaee/view/GLPage;

    iget p2, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    aget-object p1, p1, p2

    iget p2, p0, Lcom/radaee/view/GLLayoutReflow;->m_vw:I

    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_page_gap:I

    sub-int/2addr p2, v0

    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_scale:F

    iget v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_page_gap:I

    invoke-virtual {p1, p2, v0, v1}, Lcom/radaee/view/GLPage;->Reflow(IFI)Lcom/radaee/view/GLReflowCanvas;

    move-result-object p1

    const/4 p2, 0x0

    if-eqz p1, :cond_6

    .line 49
    invoke-virtual {p1}, Lcom/radaee/view/GLReflowCanvas;->getWidth()I

    move-result v0

    iget v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_page_gap:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_layw:I

    .line 50
    invoke-virtual {p1}, Lcom/radaee/view/GLReflowCanvas;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_page_gap:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_layh:I

    .line 51
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    iput v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_page:I

    .line 52
    iput-object p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_layout:Lcom/radaee/view/GLReflowCanvas;

    goto :goto_0

    .line 56
    :cond_6
    iput p2, p0, Lcom/radaee/view/GLLayoutReflow;->m_layw:I

    .line 57
    iput p2, p0, Lcom/radaee/view/GLLayoutReflow;->m_layh:I

    .line 59
    :goto_0
    iget-object p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_scroller:Landroid/widget/Scroller;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 60
    iget-object p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 61
    iget-object p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalY(I)V

    :cond_7
    :goto_1
    return-void
.end method

.method public gl_surface_create(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1

    .line 193
    invoke-super {p0, p1}, Lcom/radaee/view/GLLayout;->gl_surface_create(Ljavax/microedition/khronos/opengles/GL10;)V

    const/high16 p1, 0x40000000    # 2.0f

    const/4 v0, 0x0

    .line 194
    invoke-virtual {p0, p1, v0}, Lcom/radaee/view/GLLayoutReflow;->gl_layout(FZ)V

    return-void
.end method

.method public gl_surface_destroy(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 3

    .line 199
    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_layout:Lcom/radaee/view/GLReflowCanvas;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 200
    iget-object v2, p0, Lcom/radaee/view/GLLayoutReflow;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v0, p1, v2}, Lcom/radaee/view/GLReflowCanvas;->gl_close(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 201
    iput-object v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_goto_layout:Lcom/radaee/view/GLReflowCanvas;

    .line 203
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_layout:Lcom/radaee/view/GLReflowCanvas;

    if-eqz v0, :cond_1

    .line 204
    iget-object v2, p0, Lcom/radaee/view/GLLayoutReflow;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v0, p1, v2}, Lcom/radaee/view/GLReflowCanvas;->gl_close(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 205
    iput-object v1, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_layout:Lcom/radaee/view/GLReflowCanvas;

    .line 207
    :cond_1
    invoke-super {p0, p1}, Lcom/radaee/view/GLLayout;->gl_surface_destroy(Ljavax/microedition/khronos/opengles/GL10;)V

    return-void
.end method

.method public gl_zoom_confirm(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1

    .line 188
    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_scale:F

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/radaee/view/GLLayoutReflow;->gl_layout(FZ)V

    return-void
.end method

.method public gl_zoom_start(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0

    .line 183
    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_pageno1:I

    if-ltz p1, :cond_1

    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_pageno2:I

    if-gez p1, :cond_0

    goto :goto_0

    .line 184
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutReflow;->gl_abort_scroll()V

    :cond_1
    :goto_0
    return-void
.end method

.method public vCanSave()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public vFindStart(Ljava/lang/String;ZZ)V
    .locals 0

    .line 178
    iget-object p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_ctx:Landroid/content/Context;

    sget p2, Lcom/radaee/viewlib/R$string;->no_search_reflow:I

    const/4 p3, 0x1

    invoke-static {p1, p2, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 179
    iget-object p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {p1}, Lcom/radaee/view/VFinder;->find_end()V

    return-void
.end method

.method public vGetPage(II)I
    .locals 0

    .line 24
    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    return p1
.end method

.method public vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;
    .locals 1

    .line 66
    iget-object p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_vw:I

    if-lez p1, :cond_1

    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_vh:I

    if-gtz p1, :cond_0

    goto :goto_0

    .line 67
    :cond_0
    new-instance p1, Lcom/radaee/view/GLLayout$PDFPos;

    invoke-direct {p1}, Lcom/radaee/view/GLLayout$PDFPos;-><init>()V

    .line 68
    iget p2, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    iput p2, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    const/4 p2, 0x0

    .line 69
    iput p2, p1, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    .line 70
    iget-object p2, p0, Lcom/radaee/view/GLLayoutReflow;->m_doc:Lcom/radaee/pdf/Document;

    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    invoke-virtual {p2, v0}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p2

    iput p2, p1, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public vGotoPage(I)V
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_2

    if-ltz p1, :cond_2

    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 83
    :cond_0
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    if-ne v0, p1, :cond_1

    goto :goto_0

    .line 84
    :cond_1
    iput p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    .line 85
    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_scale:F

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/radaee/view/GLLayoutReflow;->gl_layout(FZ)V

    :cond_2
    :goto_0
    return-void
.end method

.method public vScrolltoPage(I)V
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_2

    if-ltz p1, :cond_2

    iget-object v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 91
    :cond_0
    iget v0, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    if-ne v0, p1, :cond_1

    goto :goto_0

    .line 92
    :cond_1
    iput p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_cur_page:I

    .line 93
    iget p1, p0, Lcom/radaee/view/GLLayoutReflow;->m_scale:F

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/radaee/view/GLLayoutReflow;->gl_layout(FZ)V

    :cond_2
    :goto_0
    return-void
.end method

.method public vSetPos(IILcom/radaee/view/GLLayout$PDFPos;)V
    .locals 0

    if-nez p3, :cond_0

    return-void

    .line 77
    :cond_0
    iget p1, p3, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {p0, p1}, Lcom/radaee/view/GLLayoutReflow;->vGotoPage(I)V

    return-void
.end method

.method public vSupportZoom()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
