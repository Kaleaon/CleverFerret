.class Lcom/radaee/reader/GLView$2;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private m_prepared:Z

.field final synthetic this$0:Lcom/radaee/reader/GLView;


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 538
    iput-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 539
    iput-boolean p1, p0, Lcom/radaee/reader/GLView$2;->m_prepared:Z

    return-void
.end method


# virtual methods
.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 11

    .line 590
    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    const/16 v1, 0x4000

    if-nez v0, :cond_0

    .line 593
    invoke-interface {p1, v1}, Ljavax/microedition/khronos/opengles/GL10;->glClear(I)V

    return-void

    .line 597
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$1800(Lcom/radaee/reader/GLView;)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 598
    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v2, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$1800(Lcom/radaee/reader/GLView;)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v2}, Lcom/radaee/view/GLLayout;->vSetPos(IILcom/radaee/view/GLLayout$PDFPos;)V

    .line 599
    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/radaee/reader/GLView;->access$1802(Lcom/radaee/reader/GLView;Lcom/radaee/view/GLLayout$PDFPos;)Lcom/radaee/view/GLLayout$PDFPos;

    .line 603
    :cond_1
    invoke-interface {p1, v1}, Ljavax/microedition/khronos/opengles/GL10;->glClear(I)V

    .line 604
    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0, p1}, Lcom/radaee/view/GLLayout;->gl_draw(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 605
    sget-boolean v0, Lcom/radaee/pdf/Global;->dark_mode:Z

    if-eqz v0, :cond_2

    const/16 v0, 0xbf2

    .line 606
    invoke-interface {p1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    const/16 v1, 0x1506

    .line 607
    invoke-interface {p1, v1}, Ljavax/microedition/khronos/opengles/GL10;->glLogicOp(I)V

    .line 608
    iget-object v1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$1400(Lcom/radaee/reader/GLView;)I

    move-result v6

    iget-object v1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$1500(Lcom/radaee/reader/GLView;)I

    move-result v7

    const/high16 v9, 0x3f800000    # 1.0f

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    move-object v3, p1

    invoke-virtual/range {v2 .. v10}, Lcom/radaee/view/GLLayout;->gl_fill_color(Ljavax/microedition/khronos/opengles/GL10;IIIIFFF)V

    .line 609
    invoke-interface {v3, v0}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 611
    :cond_2
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$1400(Lcom/radaee/reader/GLView;)I

    move-result v0

    shr-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$1500(Lcom/radaee/reader/GLView;)I

    move-result v1

    shr-int/lit8 v1, v1, 0x2

    invoke-virtual {p1, v0, v1}, Lcom/radaee/view/GLLayout;->vGetPage(II)I

    move-result p1

    .line 612
    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    if-eq p1, v0, :cond_3

    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 613
    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iput p1, v0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    .line 614
    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    new-instance v1, Lcom/radaee/reader/GLView$2$1;

    invoke-direct {v1, p0, p1}, Lcom/radaee/reader/GLView$2$1;-><init>(Lcom/radaee/reader/GLView$2;I)V

    invoke-virtual {v0, v1}, Lcom/radaee/reader/GLView;->post(Ljava/lang/Runnable;)Z

    .line 621
    :cond_3
    sget-boolean p1, Lcom/radaee/pdf/Global;->debug_mode:Z

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p1}, Lcom/radaee/view/GLLayout;->vHasFind()Z

    move-result p1

    if-eqz p1, :cond_5

    :cond_4
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$1100(Lcom/radaee/reader/GLView;)Lcom/radaee/reader/GLCanvas;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 622
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$1100(Lcom/radaee/reader/GLView;)Lcom/radaee/reader/GLCanvas;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->postInvalidate()V

    .line 623
    :cond_5
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p1}, Lcom/radaee/view/GLLayout;->gl_is_scroll_finished()Z

    move-result p1

    if-nez p1, :cond_6

    .line 624
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {p1}, Lcom/radaee/reader/GLView;->requestRender()V

    :cond_6
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 8

    .line 555
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onSurfaceChanged:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MR2"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 556
    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$1400(Lcom/radaee/reader/GLView;)I

    move-result v0

    if-eq v0, p2, :cond_3

    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$1500(Lcom/radaee/reader/GLView;)I

    move-result v0

    if-ne v0, p3, :cond_0

    goto/16 :goto_0

    .line 558
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0, p2}, Lcom/radaee/reader/GLView;->access$1402(Lcom/radaee/reader/GLView;I)I

    .line 559
    iget-object p2, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p2, p3}, Lcom/radaee/reader/GLView;->access$1502(Lcom/radaee/reader/GLView;I)I

    .line 560
    iget-object p2, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p2}, Lcom/radaee/reader/GLView;->access$1400(Lcom/radaee/reader/GLView;)I

    move-result p2

    iget-object p3, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p3}, Lcom/radaee/reader/GLView;->access$1500(Lcom/radaee/reader/GLView;)I

    move-result p3

    const/4 v0, 0x0

    invoke-interface {p1, v0, v0, p2, p3}, Ljavax/microedition/khronos/opengles/GL10;->glViewport(IIII)V

    const/16 p2, 0x1701

    .line 561
    invoke-interface {p1, p2}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 562
    invoke-interface {p1}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V

    .line 563
    iget-object p2, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p2}, Lcom/radaee/reader/GLView;->access$1400(Lcom/radaee/reader/GLView;)I

    move-result p2

    int-to-float v3, p2

    iget-object p2, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p2}, Lcom/radaee/reader/GLView;->access$1500(Lcom/radaee/reader/GLView;)I

    move-result p2

    int-to-float v4, p2

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v7, -0x40800000    # -1.0f

    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    invoke-interface/range {v1 .. v7}, Ljavax/microedition/khronos/opengles/GL10;->glOrthof(FFFFFF)V

    const/16 p1, 0xde1

    .line 564
    invoke-interface {v1, p1}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    const p1, 0x8074

    .line 565
    invoke-interface {v1, p1}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    const p1, 0x8078

    .line 566
    invoke-interface {v1, p1}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    const/16 p1, 0xbe2

    .line 567
    invoke-interface {v1, p1}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    const/16 p1, 0x302

    const/16 p2, 0x303

    .line 568
    invoke-interface {v1, p1, p2}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    const/16 p1, 0xbc0

    .line 570
    invoke-interface {v1, p1}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    const/16 p1, 0xb90

    .line 571
    invoke-interface {v1, p1}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    const/16 p1, 0xb71

    .line 572
    invoke-interface {v1, p1}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    const/16 p1, 0xb44

    .line 573
    invoke-interface {v1, p1}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 574
    invoke-interface {v1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glDepthMask(Z)V

    .line 576
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$1600(Lcom/radaee/reader/GLView;)I

    move-result p1

    shr-int/lit8 p1, p1, 0x10

    and-int/lit16 p1, p1, 0xff

    int-to-float p1, p1

    const/high16 p2, 0x437f0000    # 255.0f

    div-float/2addr p1, p2

    iget-object p3, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p3}, Lcom/radaee/reader/GLView;->access$1600(Lcom/radaee/reader/GLView;)I

    move-result p3

    shr-int/lit8 p3, p3, 0x8

    and-int/lit16 p3, p3, 0xff

    int-to-float p3, p3

    div-float/2addr p3, p2

    iget-object v0, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$1600(Lcom/radaee/reader/GLView;)I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-float v0, v0

    div-float/2addr v0, p2

    iget-object v2, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$1600(Lcom/radaee/reader/GLView;)I

    move-result v2

    shr-int/lit8 v2, v2, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-float v2, v2

    div-float/2addr v2, p2

    invoke-interface {v1, p1, p3, v0, v2}, Ljavax/microedition/khronos/opengles/GL10;->glClearColor(FFFF)V

    .line 577
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1, v1}, Lcom/radaee/reader/GLView;->access$1702(Lcom/radaee/reader/GLView;Ljavax/microedition/khronos/opengles/GL10;)Ljavax/microedition/khronos/opengles/GL10;

    .line 578
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-nez p1, :cond_1

    goto :goto_0

    .line 580
    :cond_1
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p1, v1}, Lcom/radaee/view/GLLayout;->gl_reset(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 581
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object p2, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p2}, Lcom/radaee/reader/GLView;->access$1400(Lcom/radaee/reader/GLView;)I

    move-result p2

    iget-object p3, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p3}, Lcom/radaee/reader/GLView;->access$1500(Lcom/radaee/reader/GLView;)I

    move-result p3

    invoke-virtual {p1, p2, p3}, Lcom/radaee/view/GLLayout;->gl_resize(II)V

    .line 582
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget p1, p1, Lcom/radaee/reader/GLView;->m_status:I

    const/16 p2, 0x64

    if-ne p1, p2, :cond_2

    .line 583
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {p1}, Lcom/radaee/reader/GLView;->PDFEndAnnot()V

    .line 584
    :cond_2
    iget-object p1, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {p1}, Lcom/radaee/reader/GLView;->requestRender()V

    :cond_3
    :goto_0
    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 1

    .line 543
    iget-object p2, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/radaee/reader/GLView;->setRenderMode(I)V

    .line 544
    iget-boolean p2, p0, Lcom/radaee/reader/GLView$2;->m_prepared:Z

    if-nez p2, :cond_0

    .line 545
    invoke-static {}, Landroid/os/Looper;->prepare()V

    const/4 p2, 0x1

    .line 546
    iput-boolean p2, p0, Lcom/radaee/reader/GLView$2;->m_prepared:Z

    :cond_0
    const/16 p2, 0xbe2

    .line 548
    invoke-interface {p1, p2}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    const/16 p2, 0x302

    const/16 v0, 0x303

    .line 549
    invoke-interface {p1, p2, v0}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    .line 550
    iget-object p2, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget-object p2, p2, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/radaee/reader/GLView$2;->this$0:Lcom/radaee/reader/GLView;

    iget-object p2, p2, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p2, p1}, Lcom/radaee/view/GLLayout;->gl_surface_create(Ljavax/microedition/khronos/opengles/GL10;)V

    :cond_1
    return-void
.end method
